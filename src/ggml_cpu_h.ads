pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
with utypes_uuint8_t_h;
with ggml_h;
with System;
with Interfaces.C.Extensions;
with sys_utypes_uint32_t_h;
with sys_utypes_uint64_t_h;
with ggml_backend_h;

package ggml_cpu_h is

   type ggml_cplan is record
      work_size : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:13
      work_data : access utypes_uuint8_t_h.uint8_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:14
      n_threads : aliased int;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:16
      threadpool : access ggml_h.ggml_threadpool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:17
      abort_callback : ggml_h.ggml_abort_callback;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:20
      abort_callback_data : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:21
      use_ref : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:24
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:12

   type ggml_numa_strategy is 
     (GGML_NUMA_STRATEGY_DISABLED,
      GGML_NUMA_STRATEGY_DISTRIBUTE,
      GGML_NUMA_STRATEGY_ISOLATE,
      GGML_NUMA_STRATEGY_NUMACTL,
      GGML_NUMA_STRATEGY_MIRROR,
      GGML_NUMA_STRATEGY_COUNT)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:28

   procedure ggml_numa_init (numa : ggml_numa_strategy)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:37
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_numa_init";

   function ggml_is_numa return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:38
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_numa";

   function ggml_new_i32 (ctx : access ggml_h.ggml_context; value : sys_utypes_uint32_t_h.int32_t) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:40
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_new_i32";

   function ggml_new_f32 (ctx : access ggml_h.ggml_context; value : float) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:41
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_new_f32";

   function ggml_set_i32 (tensor : access ggml_h.ggml_tensor; value : sys_utypes_uint32_t_h.int32_t) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:43
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_i32";

   function ggml_set_f32 (tensor : access ggml_h.ggml_tensor; value : float) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:44
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_f32";

   function ggml_get_i32_1d (tensor : access constant ggml_h.ggml_tensor; i : int) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_i32_1d";

   procedure ggml_set_i32_1d
     (tensor : access constant ggml_h.ggml_tensor;
      i : int;
      value : sys_utypes_uint32_t_h.int32_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:47
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_i32_1d";

   function ggml_get_i32_nd
     (tensor : access constant ggml_h.ggml_tensor;
      i0 : int;
      i1 : int;
      i2 : int;
      i3 : int) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:49
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_i32_nd";

   procedure ggml_set_i32_nd
     (tensor : access constant ggml_h.ggml_tensor;
      i0 : int;
      i1 : int;
      i2 : int;
      i3 : int;
      value : sys_utypes_uint32_t_h.int32_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:50
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_i32_nd";

   function ggml_get_f32_1d (tensor : access constant ggml_h.ggml_tensor; i : int) return float  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:52
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_f32_1d";

   procedure ggml_set_f32_1d
     (tensor : access constant ggml_h.ggml_tensor;
      i : int;
      value : float)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:53
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_f32_1d";

   function ggml_get_f32_nd
     (tensor : access constant ggml_h.ggml_tensor;
      i0 : int;
      i1 : int;
      i2 : int;
      i3 : int) return float  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_f32_nd";

   procedure ggml_set_f32_nd
     (tensor : access constant ggml_h.ggml_tensor;
      i0 : int;
      i1 : int;
      i2 : int;
      i3 : int;
      value : float)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_f32_nd";

   function ggml_threadpool_new (params : access ggml_h.ggml_threadpool_params) return access ggml_h.ggml_threadpool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_threadpool_new";

   procedure ggml_threadpool_free (threadpool : access ggml_h.ggml_threadpool)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_threadpool_free";

   function ggml_threadpool_get_n_threads (threadpool : access ggml_h.ggml_threadpool) return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_threadpool_get_n_threads";

   procedure ggml_threadpool_pause (threadpool : access ggml_h.ggml_threadpool)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_threadpool_pause";

   procedure ggml_threadpool_resume (threadpool : access ggml_h.ggml_threadpool)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_threadpool_resume";

   function ggml_graph_plan
     (cgraph : access constant ggml_h.ggml_cgraph;
      n_threads : int;
      threadpool : access ggml_h.ggml_threadpool) return ggml_cplan  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:66
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_plan";

   function ggml_graph_compute (cgraph : access ggml_h.ggml_cgraph; cplan : access ggml_cplan) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:70
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_compute";

   function ggml_graph_compute_with_ctx
     (ctx : access ggml_h.ggml_context;
      cgraph : access ggml_h.ggml_cgraph;
      n_threads : int) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_compute_with_ctx";

   function ggml_cpu_has_sse3 return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_sse3";

   function ggml_cpu_has_ssse3 return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_ssse3";

   function ggml_cpu_has_avx return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_avx";

   function ggml_cpu_has_avx_vnni return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_avx_vnni";

   function ggml_cpu_has_avx2 return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_avx2";

   function ggml_cpu_has_bmi2 return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:86
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_bmi2";

   function ggml_cpu_has_f16c return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_f16c";

   function ggml_cpu_has_fma return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_fma";

   function ggml_cpu_has_avx512 return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_avx512";

   function ggml_cpu_has_avx512_vbmi return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_avx512_vbmi";

   function ggml_cpu_has_avx512_vnni return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:91
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_avx512_vnni";

   function ggml_cpu_has_avx512_bf16 return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_avx512_bf16";

   function ggml_cpu_has_amx_int8 return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:93
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_amx_int8";

   function ggml_cpu_has_neon return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_neon";

   function ggml_cpu_has_arm_fma return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:96
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_arm_fma";

   function ggml_cpu_has_fp16_va return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:97
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_fp16_va";

   function ggml_cpu_has_dotprod return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_dotprod";

   function ggml_cpu_has_matmul_int8 return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_matmul_int8";

   function ggml_cpu_has_sve return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_sve";

   function ggml_cpu_get_sve_cnt return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:101
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_get_sve_cnt";

   function ggml_cpu_has_sme return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:102
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_sme";

   function ggml_cpu_has_riscv_v return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:104
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_riscv_v";

   function ggml_cpu_get_rvv_vlen return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_get_rvv_vlen";

   function ggml_cpu_has_vsx return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_vsx";

   function ggml_cpu_has_vxe return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_vxe";

   function ggml_cpu_has_wasm_simd return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_wasm_simd";

   function ggml_cpu_has_llamafile return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_has_llamafile";

   type ggml_vec_dot_t is access procedure
        (arg1 : int;
         arg2 : access float;
         arg3 : stddef_h.size_t;
         arg4 : System.Address;
         arg5 : stddef_h.size_t;
         arg6 : System.Address;
         arg7 : stddef_h.size_t;
         arg8 : int)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:113

   type ggml_type_traits_cpu is record
      from_float : ggml_h.ggml_from_float_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:117
      vec_dot : ggml_vec_dot_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:118
      vec_dot_type : aliased ggml_h.ggml_type;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:119
      nrows : aliased sys_utypes_uint64_t_h.int64_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:120
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:116

   function ggml_get_type_traits_cpu (c_type : ggml_h.ggml_type) return access constant ggml_type_traits_cpu  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_type_traits_cpu";

   procedure ggml_cpu_init  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_init";

   function ggml_backend_cpu_init return ggml_backend_h.ggml_backend_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:131
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_cpu_init";

   function ggml_backend_is_cpu (backend : ggml_backend_h.ggml_backend_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:133
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_is_cpu";

   procedure ggml_backend_cpu_set_n_threads (backend_cpu : ggml_backend_h.ggml_backend_t; n_threads : int)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:134
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_cpu_set_n_threads";

   procedure ggml_backend_cpu_set_threadpool (backend_cpu : ggml_backend_h.ggml_backend_t; threadpool : ggml_h.ggml_threadpool_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_cpu_set_threadpool";

   procedure ggml_backend_cpu_set_abort_callback
     (backend_cpu : ggml_backend_h.ggml_backend_t;
      abort_callback : ggml_h.ggml_abort_callback;
      abort_callback_data : System.Address)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_cpu_set_abort_callback";

   procedure ggml_backend_cpu_set_use_ref (backend_cpu : ggml_backend_h.ggml_backend_t; use_ref : Extensions.bool)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_cpu_set_use_ref";

   function ggml_backend_cpu_reg return ggml_backend_h.ggml_backend_reg_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_cpu_reg";

   procedure ggml_cpu_fp32_to_fp32
     (arg1 : access float;
      arg2 : access float;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_fp32_to_fp32";

   procedure ggml_cpu_fp32_to_i32
     (arg1 : access float;
      arg2 : access sys_utypes_uint32_t_h.int32_t;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:143
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_fp32_to_i32";

   procedure ggml_cpu_fp32_to_fp16
     (arg1 : access float;
      arg2 : access ggml_h.ggml_fp16_t;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_fp32_to_fp16";

   procedure ggml_cpu_fp16_to_fp32
     (arg1 : access ggml_h.ggml_fp16_t;
      arg2 : access float;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:145
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_fp16_to_fp32";

   procedure ggml_cpu_fp32_to_bf16
     (arg1 : access float;
      arg2 : access ggml_h.ggml_bf16_t;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:146
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_fp32_to_bf16";

   procedure ggml_cpu_bf16_to_fp32
     (arg1 : access constant ggml_h.ggml_bf16_t;
      arg2 : access float;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-cpu.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpu_bf16_to_fp32";

end ggml_cpu_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
