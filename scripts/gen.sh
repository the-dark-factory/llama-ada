#!/usr/bin/env bash
#
# gen.sh — regenerate the llama.cpp Ada binding (src/*_h.ads) from the C headers.
# The hand-authored wrapper (src/llama.ads + src/llama.adb) is the moat and is
# NOT touched.
#
# STATUS (2026-06-06): the METHOD below is correct and runs, but it does not yet
# produce a compile-clean drop-in for the committed binding. The committed src/
# was generated with an older Alire gcc that can no longer run fdump here (macOS
# 26 SDK vs its pre-fixed <stdio.h>); gcc-15 is the only working fdump now and it
# binds the system-header closure differently (e.g. _stdio.h -> ustdio_h). Two
# follow-ups remain before its output can replace src/: complete the system-with
# closure (a transitively-withed spec is dropped) and re-verify the wrapper
# against the regenerated types. Until then the committed binding is the
# wrapper-tested reference; this script is the recipe-in-progress, not a verified
# reproducer (cf. box2d-ada/scripts/gen.sh, which is byte-faithful).
#
# Why a separate generator compiler: llama.h is a C API in a C++-guarded header
# that pulls <stdio.h> via ggml.h. The Alire GCC is built for an older darwin,
# and its pre-fixed <stdio.h> no longer matches newer macOS SDKs ('FILE' does
# not name a type). So generation uses a current-SDK-matched gcc (Homebrew
# gcc-15 by default) purely for the fdump step; the Ada still builds with the
# Alire toolchain.
#
# Steps:
#   1. gcc -fdump-ada-spec (C++ mode, via a wrapper TU) over llama.h.
#   2. Keep the transitive with-closure from the llama.cpp project headers
#      (llama_h / ggml* / gguf*); drop the system-header spillover.
#   3. Fix the enum/getter name clashes the C API forces: any function whose
#      name collides with a type declared in the same spec is renamed <name>_f,
#      keeping its External_Name (the C symbol) — so the ABI is unchanged and
#      the wrapper, written against the _f names, still compiles.
#
# Requirements: a current-SDK gcc with -fdump-ada-spec (override with GEN_GCC),
# and a llama.cpp checkout at vendor/llama.cpp (clone llama.cpp there, or override
# with LLAMA_CPP).
set -euo pipefail
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

llama_src="${LLAMA_CPP:-$repo_root/vendor/llama.cpp}"
hdr="$llama_src/include/llama.h"
[ -f "$hdr" ] || { echo "error: $hdr not found — run scripts/setup-llama.sh (or set LLAMA_CPP)" >&2; exit 1; }

gen_gcc="${GEN_GCC:-/opt/homebrew/bin/gcc-15}"
command -v "$gen_gcc" >/dev/null 2>&1 || gen_gcc="gcc-15"
command -v "$gen_gcc" >/dev/null 2>&1 || {
  echo "error: no fdump-capable gcc ($gen_gcc). Install one (brew install gcc) or set GEN_GCC." >&2; exit 1; }

sysroot_flag=()
for sdk in /Library/Developer/CommandLineTools/SDKs/MacOSX26.sdk \
           /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk; do
  [ -d "$sdk" ] && { sysroot_flag=(-isysroot "$sdk"); break; }
done

work="$(mktemp -d)"; trap 'rm -rf "$work"' EXIT
printf '#include "llama.h"\n' > "$work/gen.cpp"
echo ">> fdump-ada-spec over llama.h  (gcc: $gen_gcc)"
( cd "$work" && "$gen_gcc" -c -fdump-ada-spec -x c++ -std=c++17 -fpermissive \
    -I "$llama_src/include" -I "$llama_src/ggml/include" "${sysroot_flag[@]}" gen.cpp ) 2>/dev/null || true

cd "$work"
compgen -G "llama_h.ads" >/dev/null || { echo "error: fdump produced no llama_h.ads" >&2; exit 1; }

# Transitive with-closure from the llama.cpp project-header roots.
keep=()
for f in llama_h.ads ggml*.ads gguf*.ads; do [ -f "$f" ] && keep+=("$f"); done
in_keep(){ local x="$1" k; for k in "${keep[@]}"; do [ "$k" = "$x" ] && return 0; done; return 1; }
changed=1
while [ "$changed" = 1 ]; do changed=0
  for f in "${keep[@]}"; do
    while IFS= read -r c; do [ -n "$c" ] || continue
      if [ -f "$c" ] && ! in_keep "$c"; then keep+=("$c"); changed=1; fi
    done < <(awk 'tolower($1)=="with"{w=$2;sub(/;.*/,"",w);print tolower(w)".ads"}' "$f")
  done
done

# Enum/getter clash fix (see header comment). Deterministic, name-driven.
clash_fixed=0
for f in "${keep[@]}"; do
  types=$(awk '($1=="type"||$1=="subtype")&&$3=="is"{print $2}' "$f" | sort -u)
  for t in $types; do
    if grep -qE "^[[:space:]]*function[[:space:]]+$t[[:space:]]*\(" "$f"; then
      sed -i '' -E "s/(^[[:space:]]*function[[:space:]]+)$t([[:space:]]*\()/\1${t}_f\2/" "$f"
      clash_fixed=$((clash_fixed+1))
    fi
  done
done

dest="$repo_root/src"
mkdir -p "$dest"
find "$dest" -name '*_h.ads' -delete            # generated specs only; keep llama.ads/.adb
for f in "${keep[@]}"; do cp "$f" "$dest/"; done

all_n=$(ls -1 *.ads | wc -l | tr -d ' ')
echo ">> kept ${#keep[@]} of $all_n specs (pruned $((all_n-${#keep[@]})) system spillovers); fixed $clash_fixed enum/getter clashes"
echo ">> wrapper src/llama.ads + src/llama.adb preserved"
