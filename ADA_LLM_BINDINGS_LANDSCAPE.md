# Ada × LLM-inference bindings — landscape deep-dive (2026-06-08)

**Question:** what other Ada bindings exist for llama.cpp / local LLM inference, and where does `df_llama` (this repo) sit?

**Method:** GitHub repo + code search (`llama|ggml|gguf|ollama language:Ada`), the Alire index, and `ohenley/awesome-ada`. Public/discoverable repos only.

## Headline finding

**There is no public Ada binding to `llama.cpp` / `libllama` / `ggml`.** None.
- `llama.cpp language:Ada` → 0 repos. `ggml language:Ada` → 0. `gguf language:Ada` → 0.
- `llama language:Ada` code search → only noise (Spanish coursework where "llamada" = call).
- `awesome-ada` Machine-Learning section lists only `fuzzyml` and `ada-fuzzy` (fuzzy logic — not neural, not LLM).

The *only* way to run an LLM from Ada today is to **talk to a separate server over HTTP** — almost always Ollama.

## What actually exists (HTTP-to-server clients, not inference bindings)

| Repo | ⭐ | Updated | What it is | Architecture |
|---|---|---|---|---|
| [reznikmm/ollama_api](https://github.com/reznikmm/ollama_api) | 1 | 2026-03 | "Ollama API library in Ada" (Maxim Reznik — prolific, reputable Ada author) | HTTP client → a running **Ollama** server |
| [gtnoble/coyote](https://github.com/gtnoble/coyote) | 0 | 2026-06-07 | Ada LLM-agent framework; `llm-providers-ollama.ads` | HTTP client → Ollama, via a provider abstraction |
| [terrym6263/ada_ollama](https://github.com/terrym6263/ada_ollama) | 0 | 2026-05 | (no description) Ollama client | HTTP client → Ollama |

**Why these are not substitutes for a llama.cpp binding:**
- They need a **separate Ollama process** running (heavy Go/llama.cpp daemon); you ship + manage that, not just a library.
- They speak **HTTP/JSON over a socket** — no in-process inference, network + serialization overhead, no embedding in a single binary.
- They expose **Ollama's REST surface**, not the **`llama.h` C API** — no direct control of sampling, KV-cache, logits, embeddings, grammars/GBNF, LoRA, tokenizer internals.
- Nothing is **verified** (no SPARK contracts anywhere in the space).

## Where `df_llama` sits

`df_llama` (this repo; renamed from `llama_ada` 2026-06-08, local-only) is a **direct, in-process binding to `libllama`** (the `llama.cpp` C API) — ~915 subprograms — plus a `Llama.Generate` convenience wrapper. That is a **different and currently absent capability** in the Ada ecosystem:
- in-process, single-binary inference; no server, no socket;
- the full `llama.h` surface (sampling, context, KV-cache, embeddings, …);
- portability handled (`LLAMA_CPP_LIB` external).

It fills a real, empty gap — it is **not** a re-implementation of something that already exists in Ada.

### The moat nobody has (any language)
The Vulkan line proved the pattern: thin generated binding → **SPARK-verified safety layer** (handle-liveness as compile-time proof). Applied here: a `Llama_Safe` layer proving `llama_model` / `llama_context` lifecycle discipline (no use-after-free of a freed context, no decode on a model that's been unloaded, batch/seq invariants). **No llama.cpp binding in *any* language is formally verified** — Python/Java/Rust/Go are all `unsafe`-at-the-FFI-boundary wrappers. That is the differentiator, not a me-too.

## Recommendation
1. `df_llama` is the **one binding in the family genuinely worth publishing** — it's first-of-kind, not redundant.
2. Lead the public framing with the **gap + the verified angle** (outcome, not mechanism): "in-process llama.cpp from Ada, with a proven lifecycle layer."
3. Needs a public repo first (currently local, no remote) before Alire submission; keep the `df_` namespace (automation-transparent).
4. Coexists cleanly with the Ollama clients — different layer of the stack (embed vs. call-a-server).
