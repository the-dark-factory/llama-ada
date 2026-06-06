pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with ggml_backend_h;
with System;
with stddef_h;
with ggml_h;
with Interfaces.C.Extensions;

package ggml_alloc_h is

   type ggml_backend_buffer_type is null record;   -- incomplete struct

   type ggml_backend is null record;   -- incomplete struct

   type ggml_tallocr is record
      buffer : ggml_backend_h.ggml_backend_buffer_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:15
      base : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:16
      alignment : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:17
      offset : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:18
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:14

   function ggml_tallocr_new (buffer : ggml_backend_h.ggml_backend_buffer_t) return ggml_tallocr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:21
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_tallocr_new";

   function ggml_tallocr_alloc (talloc : access ggml_tallocr; tensor : access ggml_h.ggml_tensor) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:22
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_tallocr_alloc";

   type ggml_gallocr is null record;   -- incomplete struct

   type ggml_gallocr_t is access all ggml_gallocr;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:46

   function ggml_gallocr_new (buft : ggml_backend_h.ggml_backend_buffer_type_t) return ggml_gallocr_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gallocr_new";

   function ggml_gallocr_new_n (bufts : System.Address; n_bufs : int) return ggml_gallocr_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:49
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gallocr_new_n";

   procedure ggml_gallocr_free (galloc : ggml_gallocr_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:50
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gallocr_free";

   function ggml_gallocr_reserve (galloc : ggml_gallocr_t; graph : access ggml_h.ggml_cgraph) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gallocr_reserve";

   procedure ggml_gallocr_reserve_n_size
     (galloc : ggml_gallocr_t;
      graph : access ggml_h.ggml_cgraph;
      node_buffer_ids : access int;
      leaf_buffer_ids : access int;
      sizes : access stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gallocr_reserve_n_size";

   function ggml_gallocr_reserve_n
     (galloc : ggml_gallocr_t;
      graph : access ggml_h.ggml_cgraph;
      node_buffer_ids : access int;
      leaf_buffer_ids : access int) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gallocr_reserve_n";

   function ggml_gallocr_alloc_graph (galloc : ggml_gallocr_t; graph : access ggml_h.ggml_cgraph) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gallocr_alloc_graph";

   function ggml_gallocr_get_buffer_size (galloc : ggml_gallocr_t; buffer_id : int) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gallocr_get_buffer_size";

   function ggml_backend_alloc_ctx_tensors_from_buft_size (ctx : access ggml_h.ggml_context; buft : ggml_backend_h.ggml_backend_buffer_type_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_alloc_ctx_tensors_from_buft_size";

   function ggml_backend_alloc_ctx_tensors_from_buft (ctx : access ggml_h.ggml_context; buft : ggml_backend_h.ggml_backend_buffer_type_t) return access ggml_h.ggml_backend_buffer  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_alloc_ctx_tensors_from_buft";

   function ggml_backend_alloc_ctx_tensors (ctx : access ggml_h.ggml_context; backend : ggml_backend_h.ggml_backend_t) return access ggml_h.ggml_backend_buffer  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-alloc.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_alloc_ctx_tensors";

end ggml_alloc_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
