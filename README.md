# llama-ada

Ada bindings to [llama.cpp](https://github.com/ggml-org/llama.cpp) — load a GGUF
model and run a local LLM **on-device from Ada**. The thin binding is generated
from llama.cpp's C headers; a small hand-authored wrapper (`Llama.Generate`)
drives a greedy decode loop and streams the continuation to stdout.

Alire crate: **`df_llama`**.

This is a **binding**, not a verified component — a bridge to llama.cpp's C, not
a proof of it.

## Build

Needs GNAT + GPRbuild (e.g. via [Alire](https://alire.ada.dev/)) and a built
llama.cpp. Point `LLAMA_CPP_LIB` at llama.cpp's `build/bin` (the gpr defaults to
`vendor/llama.cpp/build/bin`):

```sh
alr build -XLLAMA_CPP_LIB=/path/to/llama.cpp/build/bin
gprbuild -P examples/run/run.gpr -XLLAMA_CPP_LIB=/path/to/llama.cpp/build/bin
./examples/run/bin/run            # needs models/<model>.gguf present
```

The example continues a prompt with a small GGUF model (path set in `run.adb`).
Models are large and gitignored — drop a `.gguf` under `models/` to run.

## Regenerating the binding

`src/*_h.ads` is generated from llama.cpp's headers via `gcc -fdump-ada-spec`
(C++ mode) — see `scripts/gen.sh`.

> **Toolchain note.** llama.h pulls `<stdio.h>` via ggml.h, which the Alire GCC's
> pre-fixed header can't parse against a macOS-26 SDK (`FILE` does not name a
> type). Generation needs a current-SDK gcc — Homebrew `gcc-15` by default; set
> `GEN_GCC` to override. The committed binding is the wrapper-tested reference;
> `gen.sh` is the recipe-in-progress (its system-header closure still diverges
> from the committed toolchain — see the STATUS note in the script).

## Layout

| Path | What |
|------|------|
| `src/*_h.ads` | generated thin binding (llama.cpp + ggml C API) |
| `src/llama.ads` / `src/llama.adb` | hand-authored `Llama.Generate` wrapper (the moat) |
| `scripts/gen.sh` | regenerates the binding from headers |
| `examples/run/` | prompt-continuation demo |

## License

MIT (© 2026 The Dark Factory Ltd). llama.cpp is MIT (© the ggml authors).
