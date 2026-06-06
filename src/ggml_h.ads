pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with utypes_uuint16_t_h;
with sys_utypes_uint64_t_h;
with stddef_h;
with System;
with Interfaces.C.Extensions;
with sys_utypes_uint32_t_h;
with utypes_uuint8_t_h;
with utypes_uuint32_t_h;

package ggml_h is

   --  unsupported macro: GGML_API extern
   --  arg-macro: procedure GGML_DEPRECATED (func, hint)
   --    func __attribute__((deprecated(hint)))
   --  unsupported macro: GGML_ATTRIBUTE_FORMAT(...) __attribute__((format(printf, __VA_ARGS__)))
   GGML_FILE_MAGIC : constant := 16#67676d6c#;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:216
   GGML_FILE_VERSION : constant := 2;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:217

   GGML_QNT_VERSION : constant := 2;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:219
   GGML_QNT_VERSION_FACTOR : constant := 1000;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:220

   GGML_MAX_DIMS : constant := 4;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:222
   GGML_MAX_PARAMS : constant := 2048;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:223
   GGML_MAX_SRC : constant := 10;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:224
   GGML_MAX_N_THREADS : constant := 512;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:225
   GGML_MAX_OP_PARAMS : constant := 64;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:226

   GGML_MAX_NAME : constant := 64;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:229

   GGML_DEFAULT_N_THREADS : constant := 4;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:232
   GGML_DEFAULT_GRAPH_SIZE : constant := 2048;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:233

   GGML_MEM_ALIGN : constant := 16;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:243

   GGML_EXIT_SUCCESS : constant := 0;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:246
   GGML_EXIT_ABORTED : constant := 1;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:247

   GGML_ROPE_TYPE_NORMAL : constant := 0;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:250
   GGML_ROPE_TYPE_NEOX : constant := 2;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:251
   GGML_ROPE_TYPE_MROPE : constant := 8;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:252
   GGML_ROPE_TYPE_VISION : constant := 24;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:253
   GGML_ROPE_TYPE_IMROPE : constant := 40;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:254

   GGML_MROPE_SECTIONS : constant := 4;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:256
   --  arg-macro: function GGML_UNUSED (x)
   --    return void)(x;
   --  unsupported macro: GGML_UNUSED_VARS(...) do { (void)sizeof((__VA_ARGS__, 0)); } while(0)
   --  arg-macro: function GGML_PAD (x, n)
   --    return ((x) + (n) - 1) and ~((n) - 1);
   --  arg-macro: procedure GGML_UNREACHABLE ()
   --    do { fprintf(stderr, "statement should be unreachable" & ASCII.LF & ""); abort(); } while(0)
   --  unsupported macro: GGML_NORETURN [[noreturn]]
   --  unsupported macro: GGML_ABORT(...) ggml_abort(__FILE__, __LINE__, __VA_ARGS__)
   --  unsupported macro: GGML_ASSERT(x) if (!(x)) GGML_ABORT("GGML_ASSERT(%s) failed", #x)
   --  unsupported macro: GGML_TENSOR_LOCALS_1(type,prefix,pointer,array) const type prefix ##0 = (pointer) ? (pointer)->array[0] : 0; GGML_UNUSED(prefix ##0);
   --  unsupported macro: GGML_TENSOR_LOCALS_2(type,prefix,pointer,array) GGML_TENSOR_LOCALS_1 (type, prefix, pointer, array) const type prefix ##1 = (pointer) ? (pointer)->array[1] : 0; GGML_UNUSED(prefix ##1);
   --  unsupported macro: GGML_TENSOR_LOCALS_3(type,prefix,pointer,array) GGML_TENSOR_LOCALS_2 (type, prefix, pointer, array) const type prefix ##2 = (pointer) ? (pointer)->array[2] : 0; GGML_UNUSED(prefix ##2);
   --  unsupported macro: GGML_TENSOR_LOCALS(type,prefix,pointer,array) GGML_TENSOR_LOCALS_3 (type, prefix, pointer, array) const type prefix ##3 = (pointer) ? (pointer)->array[3] : 0; GGML_UNUSED(prefix ##3);
   --  unsupported macro: GGML_TENSOR_UNARY_OP_LOCALS GGML_TENSOR_LOCALS(int64_t, ne0, src0, ne) GGML_TENSOR_LOCALS(size_t, nb0, src0, nb) GGML_TENSOR_LOCALS(int64_t, ne, dst, ne) GGML_TENSOR_LOCALS(size_t, nb, dst, nb)
   --  unsupported macro: GGML_TENSOR_BINARY_OP_LOCALS GGML_TENSOR_LOCALS(int64_t, ne0, src0, ne) GGML_TENSOR_LOCALS(size_t, nb0, src0, nb) GGML_TENSOR_LOCALS(int64_t, ne1, src1, ne) GGML_TENSOR_LOCALS(size_t, nb1, src1, nb) GGML_TENSOR_LOCALS(int64_t, ne, dst, ne) GGML_TENSOR_LOCALS(size_t, nb, dst, nb)
   --  unsupported macro: GGML_TENSOR_TERNARY_OP_LOCALS GGML_TENSOR_LOCALS(int64_t, ne0, src0, ne) GGML_TENSOR_LOCALS(size_t, nb0, src0, nb) GGML_TENSOR_LOCALS(int64_t, ne1, src1, ne) GGML_TENSOR_LOCALS(size_t, nb1, src1, nb) GGML_TENSOR_LOCALS(int64_t, ne2, src2, ne) GGML_TENSOR_LOCALS(size_t, nb2, src2, nb) GGML_TENSOR_LOCALS(int64_t, ne, dst, ne) GGML_TENSOR_LOCALS(size_t, nb, dst, nb)
   --  unsupported macro: GGML_TENSOR_BINARY_OP_LOCALS01 GGML_TENSOR_LOCALS(int64_t, ne0, src0, ne) GGML_TENSOR_LOCALS(size_t, nb0, src0, nb) GGML_TENSOR_LOCALS(int64_t, ne1, src1, ne) GGML_TENSOR_LOCALS(size_t, nb1, src1, nb)

   GGML_N_TASKS_MAX : constant := (-1);  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2564
   --  unsupported macro: GGML_RESTRICT __restrict__

   type ggml_abort_callback_t is access procedure (arg1 : Interfaces.C.Strings.chars_ptr)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:349

   function ggml_set_abort_callback (callback : ggml_abort_callback_t) return ggml_abort_callback_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:353
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_abort_callback";

   procedure ggml_abort
     (file : Interfaces.C.Strings.chars_ptr;
      line : int;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:356
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_abort";

   subtype ggml_status is int;
   ggml_status_GGML_STATUS_ALLOC_FAILED : constant ggml_status := -2;
   ggml_status_GGML_STATUS_FAILED : constant ggml_status := -1;
   ggml_status_GGML_STATUS_SUCCESS : constant ggml_status := 0;
   ggml_status_GGML_STATUS_ABORTED : constant ggml_status := 1;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:358

   function ggml_status_to_string (status : ggml_status) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:366
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_status_to_string";

   subtype ggml_fp16_t is utypes_uuint16_t_h.uint16_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:370

   function ggml_fp16_to_fp32 (arg1 : ggml_fp16_t) return float  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:371
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_fp16_to_fp32";

   function ggml_fp32_to_fp16 (arg1 : float) return ggml_fp16_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:372
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_fp32_to_fp16";

   procedure ggml_fp16_to_fp32_row
     (arg1 : access ggml_fp16_t;
      arg2 : access float;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:373
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_fp16_to_fp32_row";

   procedure ggml_fp32_to_fp16_row
     (arg1 : access float;
      arg2 : access ggml_fp16_t;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:374
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_fp32_to_fp16_row";

   type ggml_bf16_t is record
      bits : aliased utypes_uuint16_t_h.uint16_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:377
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:377

   function ggml_fp32_to_bf16 (arg1 : float) return ggml_bf16_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:378
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_fp32_to_bf16";

   function ggml_bf16_to_fp32 (arg1 : ggml_bf16_t) return float  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:379
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_bf16_to_fp32";

   procedure ggml_bf16_to_fp32_row
     (arg1 : access constant ggml_bf16_t;
      arg2 : access float;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:380
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_bf16_to_fp32_row";

   procedure ggml_fp32_to_bf16_row_ref
     (arg1 : access float;
      arg2 : access ggml_bf16_t;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:381
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_fp32_to_bf16_row_ref";

   procedure ggml_fp32_to_bf16_row
     (arg1 : access float;
      arg2 : access ggml_bf16_t;
      arg3 : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:382
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_fp32_to_bf16_row";

   type ggml_object is null record;   -- incomplete struct

   type ggml_context is null record;   -- incomplete struct

   type ggml_cgraph is null record;   -- incomplete struct

   subtype ggml_type is unsigned;
   ggml_type_GGML_TYPE_F32 : constant ggml_type := 0;
   ggml_type_GGML_TYPE_F16 : constant ggml_type := 1;
   ggml_type_GGML_TYPE_Q4_0 : constant ggml_type := 2;
   ggml_type_GGML_TYPE_Q4_1 : constant ggml_type := 3;
   ggml_type_GGML_TYPE_Q5_0 : constant ggml_type := 6;
   ggml_type_GGML_TYPE_Q5_1 : constant ggml_type := 7;
   ggml_type_GGML_TYPE_Q8_0 : constant ggml_type := 8;
   ggml_type_GGML_TYPE_Q8_1 : constant ggml_type := 9;
   ggml_type_GGML_TYPE_Q2_K : constant ggml_type := 10;
   ggml_type_GGML_TYPE_Q3_K : constant ggml_type := 11;
   ggml_type_GGML_TYPE_Q4_K : constant ggml_type := 12;
   ggml_type_GGML_TYPE_Q5_K : constant ggml_type := 13;
   ggml_type_GGML_TYPE_Q6_K : constant ggml_type := 14;
   ggml_type_GGML_TYPE_Q8_K : constant ggml_type := 15;
   ggml_type_GGML_TYPE_IQ2_XXS : constant ggml_type := 16;
   ggml_type_GGML_TYPE_IQ2_XS : constant ggml_type := 17;
   ggml_type_GGML_TYPE_IQ3_XXS : constant ggml_type := 18;
   ggml_type_GGML_TYPE_IQ1_S : constant ggml_type := 19;
   ggml_type_GGML_TYPE_IQ4_NL : constant ggml_type := 20;
   ggml_type_GGML_TYPE_IQ3_S : constant ggml_type := 21;
   ggml_type_GGML_TYPE_IQ2_S : constant ggml_type := 22;
   ggml_type_GGML_TYPE_IQ4_XS : constant ggml_type := 23;
   ggml_type_GGML_TYPE_I8 : constant ggml_type := 24;
   ggml_type_GGML_TYPE_I16 : constant ggml_type := 25;
   ggml_type_GGML_TYPE_I32 : constant ggml_type := 26;
   ggml_type_GGML_TYPE_I64 : constant ggml_type := 27;
   ggml_type_GGML_TYPE_F64 : constant ggml_type := 28;
   ggml_type_GGML_TYPE_IQ1_M : constant ggml_type := 29;
   ggml_type_GGML_TYPE_BF16 : constant ggml_type := 30;
   ggml_type_GGML_TYPE_TQ1_0 : constant ggml_type := 34;
   ggml_type_GGML_TYPE_TQ2_0 : constant ggml_type := 35;
   ggml_type_GGML_TYPE_MXFP4 : constant ggml_type := 39;
   ggml_type_GGML_TYPE_NVFP4 : constant ggml_type := 40;
   ggml_type_GGML_TYPE_Q1_0 : constant ggml_type := 41;
   ggml_type_GGML_TYPE_COUNT : constant ggml_type := 42;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:389

   subtype ggml_prec is unsigned;
   ggml_prec_GGML_PREC_DEFAULT : constant ggml_prec := 0;
   ggml_prec_GGML_PREC_F32 : constant ggml_prec := 10;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:436

   type ggml_op_hint is 
     (GGML_HINT_NONE,
      GGML_HINT_SRC0_IS_HADAMARD)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:442

   subtype ggml_ftype is int;
   ggml_ftype_GGML_FTYPE_UNKNOWN : constant ggml_ftype := -1;
   ggml_ftype_GGML_FTYPE_ALL_F32 : constant ggml_ftype := 0;
   ggml_ftype_GGML_FTYPE_MOSTLY_F16 : constant ggml_ftype := 1;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q4_0 : constant ggml_ftype := 2;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q4_1 : constant ggml_ftype := 3;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q4_1_SOME_F16 : constant ggml_ftype := 4;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q8_0 : constant ggml_ftype := 7;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q5_0 : constant ggml_ftype := 8;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q5_1 : constant ggml_ftype := 9;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q2_K : constant ggml_ftype := 10;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q3_K : constant ggml_ftype := 11;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q4_K : constant ggml_ftype := 12;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q5_K : constant ggml_ftype := 13;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q6_K : constant ggml_ftype := 14;
   ggml_ftype_GGML_FTYPE_MOSTLY_IQ2_XXS : constant ggml_ftype := 15;
   ggml_ftype_GGML_FTYPE_MOSTLY_IQ2_XS : constant ggml_ftype := 16;
   ggml_ftype_GGML_FTYPE_MOSTLY_IQ3_XXS : constant ggml_ftype := 17;
   ggml_ftype_GGML_FTYPE_MOSTLY_IQ1_S : constant ggml_ftype := 18;
   ggml_ftype_GGML_FTYPE_MOSTLY_IQ4_NL : constant ggml_ftype := 19;
   ggml_ftype_GGML_FTYPE_MOSTLY_IQ3_S : constant ggml_ftype := 20;
   ggml_ftype_GGML_FTYPE_MOSTLY_IQ2_S : constant ggml_ftype := 21;
   ggml_ftype_GGML_FTYPE_MOSTLY_IQ4_XS : constant ggml_ftype := 22;
   ggml_ftype_GGML_FTYPE_MOSTLY_IQ1_M : constant ggml_ftype := 23;
   ggml_ftype_GGML_FTYPE_MOSTLY_BF16 : constant ggml_ftype := 24;
   ggml_ftype_GGML_FTYPE_MOSTLY_MXFP4 : constant ggml_ftype := 25;
   ggml_ftype_GGML_FTYPE_MOSTLY_NVFP4 : constant ggml_ftype := 26;
   ggml_ftype_GGML_FTYPE_MOSTLY_Q1_0 : constant ggml_ftype := 27;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:448

   type ggml_op is 
     (GGML_OP_NONE,
      GGML_OP_DUP,
      GGML_OP_ADD,
      GGML_OP_ADD_ID,
      GGML_OP_ADD1,
      GGML_OP_ACC,
      GGML_OP_SUB,
      GGML_OP_MUL,
      GGML_OP_DIV,
      GGML_OP_SQR,
      GGML_OP_SQRT,
      GGML_OP_LOG,
      GGML_OP_SIN,
      GGML_OP_COS,
      GGML_OP_SUM,
      GGML_OP_SUM_ROWS,
      GGML_OP_CUMSUM,
      GGML_OP_MEAN,
      GGML_OP_ARGMAX,
      GGML_OP_COUNT_EQUAL,
      GGML_OP_REPEAT,
      GGML_OP_REPEAT_BACK,
      GGML_OP_CONCAT,
      GGML_OP_SILU_BACK,
      GGML_OP_NORM,
      GGML_OP_RMS_NORM,
      GGML_OP_RMS_NORM_BACK,
      GGML_OP_GROUP_NORM,
      GGML_OP_L2_NORM,
      GGML_OP_MUL_MAT,
      GGML_OP_MUL_MAT_ID,
      GGML_OP_OUT_PROD,
      GGML_OP_SCALE,
      GGML_OP_SET,
      GGML_OP_CPY,
      GGML_OP_CONT,
      GGML_OP_RESHAPE,
      GGML_OP_VIEW,
      GGML_OP_PERMUTE,
      GGML_OP_TRANSPOSE,
      GGML_OP_GET_ROWS,
      GGML_OP_GET_ROWS_BACK,
      GGML_OP_SET_ROWS,
      GGML_OP_DIAG,
      GGML_OP_DIAG_MASK_INF,
      GGML_OP_DIAG_MASK_ZERO,
      GGML_OP_SOFT_MAX,
      GGML_OP_SOFT_MAX_BACK,
      GGML_OP_ROPE,
      GGML_OP_ROPE_BACK,
      GGML_OP_CLAMP,
      GGML_OP_CONV_TRANSPOSE_1D,
      GGML_OP_IM2COL,
      GGML_OP_IM2COL_BACK,
      GGML_OP_IM2COL_3D,
      GGML_OP_CONV_2D,
      GGML_OP_CONV_3D,
      GGML_OP_CONV_2D_DW,
      GGML_OP_CONV_TRANSPOSE_2D,
      GGML_OP_POOL_1D,
      GGML_OP_POOL_2D,
      GGML_OP_POOL_2D_BACK,
      GGML_OP_UPSCALE,
      GGML_OP_PAD,
      GGML_OP_PAD_REFLECT_1D,
      GGML_OP_ROLL,
      GGML_OP_ARANGE,
      GGML_OP_TIMESTEP_EMBEDDING,
      GGML_OP_ARGSORT,
      GGML_OP_TOP_K,
      GGML_OP_LEAKY_RELU,
      GGML_OP_TRI,
      GGML_OP_FILL,
      GGML_OP_FLASH_ATTN_EXT,
      GGML_OP_FLASH_ATTN_BACK,
      GGML_OP_SSM_CONV,
      GGML_OP_SSM_SCAN,
      GGML_OP_WIN_PART,
      GGML_OP_WIN_UNPART,
      GGML_OP_GET_REL_POS,
      GGML_OP_ADD_REL_POS,
      GGML_OP_RWKV_WKV6,
      GGML_OP_GATED_LINEAR_ATTN,
      GGML_OP_RWKV_WKV7,
      GGML_OP_SOLVE_TRI,
      GGML_OP_GATED_DELTA_NET,
      GGML_OP_UNARY,
      GGML_OP_MAP_CUSTOM1,
      GGML_OP_MAP_CUSTOM2,
      GGML_OP_MAP_CUSTOM3,
      GGML_OP_CUSTOM,
      GGML_OP_CROSS_ENTROPY_LOSS,
      GGML_OP_CROSS_ENTROPY_LOSS_BACK,
      GGML_OP_OPT_STEP_ADAMW,
      GGML_OP_OPT_STEP_SGD,
      GGML_OP_GLU,
      GGML_OP_COUNT)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:479

   type ggml_unary_op is 
     (GGML_UNARY_OP_ABS,
      GGML_UNARY_OP_SGN,
      GGML_UNARY_OP_NEG,
      GGML_UNARY_OP_STEP,
      GGML_UNARY_OP_TANH,
      GGML_UNARY_OP_ELU,
      GGML_UNARY_OP_RELU,
      GGML_UNARY_OP_SIGMOID,
      GGML_UNARY_OP_GELU,
      GGML_UNARY_OP_GELU_QUICK,
      GGML_UNARY_OP_SILU,
      GGML_UNARY_OP_HARDSWISH,
      GGML_UNARY_OP_HARDSIGMOID,
      GGML_UNARY_OP_EXP,
      GGML_UNARY_OP_EXPM1,
      GGML_UNARY_OP_SOFTPLUS,
      GGML_UNARY_OP_GELU_ERF,
      GGML_UNARY_OP_XIELU,
      GGML_UNARY_OP_FLOOR,
      GGML_UNARY_OP_CEIL,
      GGML_UNARY_OP_ROUND,
      GGML_UNARY_OP_TRUNC,
      GGML_UNARY_OP_COUNT)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:589

   type ggml_glu_op is 
     (GGML_GLU_OP_REGLU,
      GGML_GLU_OP_GEGLU,
      GGML_GLU_OP_SWIGLU,
      GGML_GLU_OP_SWIGLU_OAI,
      GGML_GLU_OP_GEGLU_ERF,
      GGML_GLU_OP_GEGLU_QUICK,
      GGML_GLU_OP_COUNT)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:616

   type ggml_object_type is 
     (GGML_OBJECT_TYPE_TENSOR,
      GGML_OBJECT_TYPE_GRAPH,
      GGML_OBJECT_TYPE_WORK_BUFFER)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:627

   type ggml_log_level is 
     (GGML_LOG_LEVEL_NONE,
      GGML_LOG_LEVEL_DEBUG,
      GGML_LOG_LEVEL_INFO,
      GGML_LOG_LEVEL_WARN,
      GGML_LOG_LEVEL_ERROR,
      GGML_LOG_LEVEL_CONT)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:633

   subtype ggml_tensor_flag is unsigned;
   ggml_tensor_flag_GGML_TENSOR_FLAG_INPUT : constant ggml_tensor_flag := 1;
   ggml_tensor_flag_GGML_TENSOR_FLAG_OUTPUT : constant ggml_tensor_flag := 2;
   ggml_tensor_flag_GGML_TENSOR_FLAG_PARAM : constant ggml_tensor_flag := 4;
   ggml_tensor_flag_GGML_TENSOR_FLAG_LOSS : constant ggml_tensor_flag := 8;
   ggml_tensor_flag_GGML_TENSOR_FLAG_COMPUTE : constant ggml_tensor_flag := 16;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:643

   type ggml_tri_type is 
     (GGML_TRI_TYPE_UPPER_DIAG,
      GGML_TRI_TYPE_UPPER,
      GGML_TRI_TYPE_LOWER_DIAG,
      GGML_TRI_TYPE_LOWER)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:651

   type ggml_init_params is record
      mem_size : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:660
      mem_buffer : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:661
      no_alloc : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:662
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:658

   type ggml_backend_buffer;
   type anon_array1965 is array (0 .. 3) of aliased sys_utypes_uint64_t_h.int64_t;
   type anon_array1967 is array (0 .. 3) of aliased stddef_h.size_t;
   type anon_array1969 is array (0 .. 15) of aliased sys_utypes_uint32_t_h.int32_t;
   type ggml_tensor;
   type anon_array1972 is array (0 .. 9) of access ggml_tensor;
   subtype anon_array1974 is Interfaces.C.char_array (0 .. 63);
   subtype anon_array1795 is Interfaces.C.char_array (0 .. 7);
   type ggml_tensor is record
      c_type : aliased ggml_type;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:667
      buffer : access ggml_backend_buffer;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:669
      ne : aliased anon_array1965;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:671
      nb : aliased anon_array1967;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:672
      op : aliased ggml_op;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:678
      op_params : aliased anon_array1969;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:681
      flags : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:683
      src : anon_array1972;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:685
      view_src : access ggml_tensor;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:688
      view_offs : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:689
      data : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:691
      name : aliased anon_array1974;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:693
      extra : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:695
      padding : aliased anon_array1795;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:697
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:666

   type ggml_backend_buffer is null record;   -- incomplete struct

   GGML_TENSOR_SIZE : aliased constant stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:700
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZL16GGML_TENSOR_SIZE";

   type ggml_abort_callback is access function (arg1 : System.Address) return Extensions.bool
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:705

   type ggml_guid is array (0 .. 15) of aliased utypes_uuint8_t_h.uint8_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:713

   type ggml_guid_t is access all ggml_guid;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:714

   function ggml_guid_matches (guid_a : ggml_guid_t; guid_b : ggml_guid_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:716
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_guid_matches";

   function ggml_version return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:720
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_version";

   function ggml_commit return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:721
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_commit";

   procedure ggml_time_init  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:723
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_time_init";

   function ggml_time_ms return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:724
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_time_ms";

   function ggml_time_us return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:725
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_time_us";

   function ggml_cycles return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:726
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cycles";

   function ggml_cycles_per_ms return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:727
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cycles_per_ms";

   procedure ggml_print_object (obj : access constant ggml_object)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:732
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_print_object";

   procedure ggml_print_objects (ctx : access constant ggml_context)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:733
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_print_objects";

   function ggml_nelements (tensor : access constant ggml_tensor) return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:735
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_nelements";

   function ggml_nrows (tensor : access constant ggml_tensor) return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:736
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_nrows";

   function ggml_nbytes (tensor : access constant ggml_tensor) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:737
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_nbytes";

   function ggml_nbytes_pad (tensor : access constant ggml_tensor) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:738
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_nbytes_pad";

   function ggml_blck_size (c_type : ggml_type) return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:740
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_blck_size";

   function ggml_type_size (c_type : ggml_type) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:741
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_type_size";

   function ggml_row_size (c_type : ggml_type; ne : sys_utypes_uint64_t_h.int64_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:742
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_row_size";

   function ggml_type_sizef (c_type : ggml_type) return double  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:744
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_type_sizef";

   function ggml_type_name (c_type : ggml_type) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:748
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_type_name";

   function ggml_op_name (op : ggml_op) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:749
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_op_name";

   function ggml_op_symbol (op : ggml_op) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:750
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_op_symbol";

   function ggml_unary_op_name (op : ggml_unary_op) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:752
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_unary_op_name";

   function ggml_glu_op_name (op : ggml_glu_op) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:753
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_glu_op_name";

   function ggml_op_desc (t : access constant ggml_tensor) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:754
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_op_desc";

   function ggml_element_size (tensor : access constant ggml_tensor) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:756
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_element_size";

   function ggml_is_quantized (c_type : ggml_type) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:758
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_quantized";

   function ggml_ftype_to_ggml_type (ftype : ggml_ftype) return ggml_type  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:761
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_ftype_to_ggml_type";

   function ggml_is_transposed (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:763
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_transposed";

   function ggml_is_permuted (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:764
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_permuted";

   function ggml_is_empty (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:765
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_empty";

   function ggml_is_view (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:766
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_view";

   function ggml_is_scalar (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:767
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_scalar";

   function ggml_is_vector (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:768
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_vector";

   function ggml_is_matrix (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:769
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_matrix";

   function ggml_is_3d (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:770
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_3d";

   function ggml_n_dims (tensor : access constant ggml_tensor) return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:771
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_n_dims";

   function ggml_is_contiguous (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:774
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_contiguous";

   function ggml_is_contiguous_0 (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:775
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_contiguous_0";

   function ggml_is_contiguous_1 (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:776
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_contiguous_1";

   function ggml_is_contiguous_2 (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:777
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_contiguous_2";

   function ggml_is_contiguously_allocated (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:780
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_contiguously_allocated";

   function ggml_is_contiguous_channels (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:783
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_contiguous_channels";

   function ggml_is_contiguous_rows (tensor : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:786
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_is_contiguous_rows";

   function ggml_are_same_shape (t0 : access constant ggml_tensor; t1 : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:788
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_are_same_shape";

   function ggml_are_same_stride (t0 : access constant ggml_tensor; t1 : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:789
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_are_same_stride";

   function ggml_can_repeat (t0 : access constant ggml_tensor; t1 : access constant ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:791
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_can_repeat";

   function ggml_tensor_overhead return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:794
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_tensor_overhead";

   function ggml_validate_row_data
     (c_type : ggml_type;
      data : System.Address;
      nbytes : stddef_h.size_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:796
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_validate_row_data";

   function ggml_init (params : ggml_init_params) return access ggml_context  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:800
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_init";

   procedure ggml_reset (ctx : access ggml_context)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:801
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_reset";

   procedure ggml_free (ctx : access ggml_context)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:802
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_free";

   function ggml_used_mem (ctx : access constant ggml_context) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:804
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_used_mem";

   function ggml_get_no_alloc (ctx : access ggml_context) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:806
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_no_alloc";

   procedure ggml_set_no_alloc (ctx : access ggml_context; no_alloc : Extensions.bool)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:807
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_no_alloc";

   function ggml_get_mem_buffer (ctx : access constant ggml_context) return System.Address  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:809
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_mem_buffer";

   function ggml_get_mem_size (ctx : access constant ggml_context) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:810
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_mem_size";

   function ggml_get_max_tensor_size (ctx : access constant ggml_context) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:811
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_max_tensor_size";

   function ggml_new_tensor
     (ctx : access ggml_context;
      c_type : ggml_type;
      n_dims : int;
      ne : access sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:813
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_new_tensor";

   function ggml_new_tensor_1d
     (ctx : access ggml_context;
      c_type : ggml_type;
      ne0 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:819
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_new_tensor_1d";

   function ggml_new_tensor_2d
     (ctx : access ggml_context;
      c_type : ggml_type;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:824
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_new_tensor_2d";

   function ggml_new_tensor_3d
     (ctx : access ggml_context;
      c_type : ggml_type;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_new_tensor_3d";

   function ggml_new_tensor_4d
     (ctx : access ggml_context;
      c_type : ggml_type;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t;
      ne3 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:837
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_new_tensor_4d";

   function ggml_new_buffer (ctx : access ggml_context; nbytes : stddef_h.size_t) return System.Address  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:845
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_new_buffer";

   function ggml_dup_tensor (ctx : access ggml_context; src : access constant ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:847
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_dup_tensor";

   function ggml_view_tensor (ctx : access ggml_context; src : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:848
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_view_tensor";

   function ggml_get_first_tensor (ctx : access constant ggml_context) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:851
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_first_tensor";

   function ggml_get_next_tensor (ctx : access constant ggml_context; tensor : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:852
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_next_tensor";

   function ggml_get_tensor (ctx : access ggml_context; name : Interfaces.C.Strings.chars_ptr) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:853
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_tensor";

   procedure ggml_unravel_index
     (tensor : access constant ggml_tensor;
      i : sys_utypes_uint64_t_h.int64_t;
      i0 : access sys_utypes_uint64_t_h.int64_t;
      i1 : access sys_utypes_uint64_t_h.int64_t;
      i2 : access sys_utypes_uint64_t_h.int64_t;
      i3 : access sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:856
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_unravel_index";

   function ggml_get_unary_op (tensor : access constant ggml_tensor) return ggml_unary_op  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:858
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_unary_op";

   function ggml_get_glu_op (tensor : access constant ggml_tensor) return ggml_glu_op  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:859
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_glu_op";

   function ggml_get_data (tensor : access constant ggml_tensor) return System.Address  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:861
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_data";

   function ggml_get_data_f32 (tensor : access constant ggml_tensor) return access float  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:862
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_data_f32";

   function ggml_get_name (tensor : access constant ggml_tensor) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:864
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_name";

   function ggml_set_name (tensor : access ggml_tensor; name : Interfaces.C.Strings.chars_ptr) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:865
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_name";

   function ggml_format_name (tensor : access ggml_tensor; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:867
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_format_name";

   procedure ggml_set_input (tensor : access ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:870
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_input";

   procedure ggml_set_output (tensor : access ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:871
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_output";

   procedure ggml_set_param (tensor : access ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:872
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_param";

   procedure ggml_set_loss (tensor : access ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:873
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_loss";

   function ggml_dup (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:879
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_dup";

   function ggml_dup_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:884
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_dup_inplace";

   function ggml_add
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:888
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_add";

   function ggml_add_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:893
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_add_inplace";

   function ggml_add_cast
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c_type : ggml_type) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:898
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_add_cast";

   function ggml_add_id
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      ids : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:905
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_add_id";

   function ggml_add1
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:911
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_add1";

   function ggml_add1_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:917
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_add1_inplace";

   function ggml_acc
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      nb1 : stddef_h.size_t;
      nb2 : stddef_h.size_t;
      nb3 : stddef_h.size_t;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:926
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_acc";

   function ggml_acc_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      nb1 : stddef_h.size_t;
      nb2 : stddef_h.size_t;
      nb3 : stddef_h.size_t;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:935
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_acc_inplace";

   function ggml_sub
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:944
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sub";

   function ggml_sub_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:949
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sub_inplace";

   function ggml_mul
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:954
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_mul";

   function ggml_mul_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:959
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_mul_inplace";

   function ggml_div
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:964
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_div";

   function ggml_div_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:969
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_div_inplace";

   function ggml_sqr (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:974
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sqr";

   function ggml_sqr_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:978
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sqr_inplace";

   function ggml_sqrt (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:982
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sqrt";

   function ggml_sqrt_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:986
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sqrt_inplace";

   function ggml_log (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:990
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_log";

   function ggml_log_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:994
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_log_inplace";

   function ggml_expm1 (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:998
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_expm1";

   function ggml_expm1_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1002
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_expm1_inplace";

   function ggml_softplus (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1006
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_softplus";

   function ggml_softplus_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1010
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_softplus_inplace";

   function ggml_sin (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1014
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sin";

   function ggml_sin_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1018
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sin_inplace";

   function ggml_cos (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1022
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cos";

   function ggml_cos_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1026
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cos_inplace";

   function ggml_sum (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1031
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sum";

   function ggml_sum_rows (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1036
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sum_rows";

   function ggml_cumsum (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1040
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cumsum";

   function ggml_mean (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1045
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_mean";

   function ggml_argmax (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1050
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_argmax";

   function ggml_count_equal
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1055
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_count_equal";

   function ggml_repeat
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1062
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_repeat";

   function ggml_repeat_4d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t;
      ne3 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1068
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_repeat_4d";

   function ggml_repeat_back
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1077
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_repeat_back";

   function ggml_concat
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      dim : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1084
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_concat";

   function ggml_abs (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1090
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_abs";

   function ggml_abs_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1094
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_abs_inplace";

   function ggml_sgn (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1098
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sgn";

   function ggml_sgn_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1102
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sgn_inplace";

   function ggml_neg (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1106
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_neg";

   function ggml_neg_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1110
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_neg_inplace";

   function ggml_step (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1114
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_step";

   function ggml_step_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1118
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_step_inplace";

   function ggml_tanh (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1122
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_tanh";

   function ggml_tanh_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1126
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_tanh_inplace";

   function ggml_elu (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1130
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_elu";

   function ggml_elu_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1134
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_elu_inplace";

   function ggml_relu (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1138
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_relu";

   function ggml_leaky_relu
     (ctx : access ggml_context;
      a : access ggml_tensor;
      negative_slope : float;
      inplace : Extensions.bool) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1142
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_leaky_relu";

   function ggml_relu_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1146
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_relu_inplace";

   function ggml_sigmoid (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1150
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sigmoid";

   function ggml_sigmoid_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1154
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_sigmoid_inplace";

   function ggml_gelu (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1158
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gelu";

   function ggml_gelu_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1162
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gelu_inplace";

   function ggml_gelu_erf (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1168
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gelu_erf";

   function ggml_gelu_erf_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1172
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gelu_erf_inplace";

   function ggml_gelu_quick (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1176
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gelu_quick";

   function ggml_gelu_quick_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1180
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gelu_quick_inplace";

   function ggml_silu (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1184
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_silu";

   function ggml_silu_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1188
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_silu_inplace";

   function ggml_silu_back
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1194
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_silu_back";

   function ggml_hardswish (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1200
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_hardswish";

   function ggml_hardsigmoid (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1205
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_hardsigmoid";

   function ggml_exp (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1209
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_exp";

   function ggml_exp_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1213
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_exp_inplace";

   function ggml_floor (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1217
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_floor";

   function ggml_floor_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1221
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_floor_inplace";

   function ggml_ceil (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1225
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_ceil";

   function ggml_ceil_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1229
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_ceil_inplace";

   function ggml_round (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1233
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_round";

   function ggml_round_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1237
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_round_inplace";

   function ggml_trunc (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1247
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_trunc";

   function ggml_trunc_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1251
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_trunc_inplace";

   function ggml_xielu
     (ctx : access ggml_context;
      a : access ggml_tensor;
      alpha_n : float;
      alpha_p : float;
      beta : float;
      eps : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1261
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_xielu";

   function ggml_glu
     (ctx : access ggml_context;
      a : access ggml_tensor;
      op : ggml_glu_op;
      swapped : Extensions.bool) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1273
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_glu";

   function ggml_reglu (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1279
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_reglu";

   function ggml_reglu_swapped (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1283
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_reglu_swapped";

   function ggml_geglu (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1287
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_geglu";

   function ggml_geglu_swapped (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1291
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_geglu_swapped";

   function ggml_swiglu (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1295
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_swiglu";

   function ggml_swiglu_swapped (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1299
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_swiglu_swapped";

   function ggml_geglu_erf (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1303
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_geglu_erf";

   function ggml_geglu_erf_swapped (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1307
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_geglu_erf_swapped";

   function ggml_geglu_quick (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1311
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_geglu_quick";

   function ggml_geglu_quick_swapped (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1315
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_geglu_quick_swapped";

   function ggml_glu_split
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      op : ggml_glu_op) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1321
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_glu_split";

   function ggml_reglu_split
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1327
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_reglu_split";

   function ggml_geglu_split
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1332
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_geglu_split";

   function ggml_swiglu_split
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1337
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_swiglu_split";

   function ggml_geglu_erf_split
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1342
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_geglu_erf_split";

   function ggml_geglu_quick_split
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1347
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_geglu_quick_split";

   function ggml_swiglu_oai
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      alpha : float;
      limit : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1352
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_swiglu_oai";

   function ggml_norm
     (ctx : access ggml_context;
      a : access ggml_tensor;
      eps : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1360
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_norm";

   function ggml_norm_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      eps : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1365
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_norm_inplace";

   function ggml_rms_norm
     (ctx : access ggml_context;
      a : access ggml_tensor;
      eps : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1370
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rms_norm";

   function ggml_rms_norm_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      eps : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1375
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rms_norm_inplace";

   function ggml_group_norm
     (ctx : access ggml_context;
      a : access ggml_tensor;
      n_groups : int;
      eps : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1382
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_group_norm";

   function ggml_group_norm_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      n_groups : int;
      eps : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1388
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_group_norm_inplace";

   function ggml_l2_norm
     (ctx : access ggml_context;
      a : access ggml_tensor;
      eps : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1396
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_l2_norm";

   function ggml_l2_norm_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      eps : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1401
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_l2_norm_inplace";

   function ggml_rms_norm_back
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      eps : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1408
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rms_norm_back";

   function ggml_mul_mat
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1417
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_mul_mat";

   procedure ggml_mul_mat_set_prec (a : access ggml_tensor; prec : ggml_prec)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1424
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_mul_mat_set_prec";

   procedure ggml_mul_mat_set_hint (a : access ggml_tensor; hint : ggml_op_hint)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1429
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_mul_mat_set_hint";

   function ggml_mul_mat_id
     (ctx : access ggml_context;
      as : access ggml_tensor;
      b : access ggml_tensor;
      ids : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1434
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_mul_mat_id";

   function ggml_out_prod
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1443
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_out_prod";

   function ggml_scale
     (ctx : access ggml_context;
      a : access ggml_tensor;
      s : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1452
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_scale";

   function ggml_scale_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      s : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1458
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_scale_inplace";

   function ggml_scale_bias
     (ctx : access ggml_context;
      a : access ggml_tensor;
      s : float;
      b : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1464
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_scale_bias";

   function ggml_scale_bias_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      s : float;
      b : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1470
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_scale_bias_inplace";

   function ggml_set
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      nb1 : stddef_h.size_t;
      nb2 : stddef_h.size_t;
      nb3 : stddef_h.size_t;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1477
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set";

   function ggml_set_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      nb1 : stddef_h.size_t;
      nb2 : stddef_h.size_t;
      nb3 : stddef_h.size_t;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1487
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_inplace";

   function ggml_set_1d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1496
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_1d";

   function ggml_set_1d_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1502
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_1d_inplace";

   function ggml_set_2d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      nb1 : stddef_h.size_t;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1509
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_2d";

   function ggml_set_2d_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      nb1 : stddef_h.size_t;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1517
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_2d_inplace";

   function ggml_cpy
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1525
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cpy";

   function ggml_cast
     (ctx : access ggml_context;
      a : access ggml_tensor;
      c_type : ggml_type) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1531
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cast";

   function ggml_cont (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1537
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cont";

   function ggml_cont_1d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1542
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cont_1d";

   function ggml_cont_2d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1547
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cont_2d";

   function ggml_cont_3d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1553
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cont_3d";

   function ggml_cont_4d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t;
      ne3 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1560
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cont_4d";

   function ggml_reshape
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1570
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_reshape";

   function ggml_reshape_1d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1577
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_reshape_1d";

   function ggml_reshape_2d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1582
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_reshape_2d";

   function ggml_reshape_3d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1590
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_reshape_3d";

   function ggml_reshape_4d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t;
      ne3 : sys_utypes_uint64_t_h.int64_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1597
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_reshape_4d";

   function ggml_view_1d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1606
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_view_1d";

   function ggml_view_2d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      nb1 : stddef_h.size_t;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1612
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_view_2d";

   function ggml_view_3d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t;
      nb1 : stddef_h.size_t;
      nb2 : stddef_h.size_t;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1620
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_view_3d";

   function ggml_view_4d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t;
      ne3 : sys_utypes_uint64_t_h.int64_t;
      nb1 : stddef_h.size_t;
      nb2 : stddef_h.size_t;
      nb3 : stddef_h.size_t;
      offset : stddef_h.size_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1630
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_view_4d";

   function ggml_permute
     (ctx : access ggml_context;
      a : access ggml_tensor;
      axis0 : int;
      axis1 : int;
      axis2 : int;
      axis3 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1642
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_permute";

   function ggml_transpose (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1651
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_transpose";

   function ggml_get_rows
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1660
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_rows";

   function ggml_get_rows_back
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1665
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_rows_back";

   function ggml_set_rows
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1682
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_rows";

   function ggml_diag (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1688
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_diag";

   function ggml_diag_mask_inf
     (ctx : access ggml_context;
      a : access ggml_tensor;
      n_past : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1693
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_diag_mask_inf";

   function ggml_diag_mask_inf_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      n_past : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1699
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_diag_mask_inf_inplace";

   function ggml_diag_mask_zero
     (ctx : access ggml_context;
      a : access ggml_tensor;
      n_past : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1705
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_diag_mask_zero";

   function ggml_diag_mask_zero_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      n_past : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1711
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_diag_mask_zero_inplace";

   function ggml_soft_max (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1716
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_soft_max";

   function ggml_soft_max_inplace (ctx : access ggml_context; a : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1721
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_soft_max_inplace";

   function ggml_soft_max_ext
     (ctx : access ggml_context;
      a : access ggml_tensor;
      mask : access ggml_tensor;
      scale : float;
      max_bias : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1734
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_soft_max_ext";

   function ggml_soft_max_ext_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      mask : access ggml_tensor;
      scale : float;
      max_bias : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1741
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_soft_max_ext_inplace";

   procedure ggml_soft_max_add_sinks (a : access ggml_tensor; sinks : access ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1748
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_soft_max_add_sinks";

   function ggml_soft_max_ext_back
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      scale : float;
      max_bias : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1752
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_soft_max_ext_back";

   function ggml_soft_max_ext_back_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      scale : float;
      max_bias : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1760
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_soft_max_ext_back_inplace";

   function ggml_rope
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      n_dims : int;
      mode : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1772
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope";

   function ggml_rope_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      n_dims : int;
      mode : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1780
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope_inplace";

   function ggml_rope_ext
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor;
      n_dims : int;
      mode : int;
      n_ctx_orig : int;
      freq_base : float;
      freq_scale : float;
      ext_factor : float;
      attn_factor : float;
      beta_fast : float;
      beta_slow : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1813
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope_ext";

   function ggml_rope_multi
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor;
      n_dims : int;
      sections : access int;
      mode : int;
      n_ctx_orig : int;
      freq_base : float;
      freq_scale : float;
      ext_factor : float;
      attn_factor : float;
      beta_fast : float;
      beta_slow : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1858
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope_multi";

   function ggml_rope_ext_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor;
      n_dims : int;
      mode : int;
      n_ctx_orig : int;
      freq_base : float;
      freq_scale : float;
      ext_factor : float;
      attn_factor : float;
      beta_fast : float;
      beta_slow : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1875
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope_ext_inplace";

   function ggml_rope_multi_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor;
      n_dims : int;
      sections : access int;
      mode : int;
      n_ctx_orig : int;
      freq_base : float;
      freq_scale : float;
      ext_factor : float;
      attn_factor : float;
      beta_fast : float;
      beta_slow : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1890
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope_multi_inplace";

   function ggml_rope_custom
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      n_dims : int;
      mode : int;
      n_ctx_orig : int;
      freq_base : float;
      freq_scale : float;
      ext_factor : float;
      attn_factor : float;
      beta_fast : float;
      beta_slow : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1906
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope_custom";

   function ggml_rope_custom_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      n_dims : int;
      mode : int;
      n_ctx_orig : int;
      freq_base : float;
      freq_scale : float;
      ext_factor : float;
      attn_factor : float;
      beta_fast : float;
      beta_slow : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1921
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope_custom_inplace";

   procedure ggml_rope_yarn_corr_dims
     (n_dims : int;
      n_ctx_orig : int;
      freq_base : float;
      beta_fast : float;
      beta_slow : float;
      dims : access float)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1937
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope_yarn_corr_dims";

   function ggml_rope_ext_back
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor;
      n_dims : int;
      mode : int;
      n_ctx_orig : int;
      freq_base : float;
      freq_scale : float;
      ext_factor : float;
      attn_factor : float;
      beta_fast : float;
      beta_slow : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1942
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope_ext_back";

   function ggml_rope_multi_back
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor;
      n_dims : int;
      sections : access int;
      mode : int;
      n_ctx_orig : int;
      freq_base : float;
      freq_scale : float;
      ext_factor : float;
      attn_factor : float;
      beta_fast : float;
      beta_slow : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1957
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rope_multi_back";

   function ggml_clamp
     (ctx : access ggml_context;
      a : access ggml_tensor;
      min : float;
      max : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1976
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_clamp";

   function ggml_im2col
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      s0 : int;
      s1 : int;
      p0 : int;
      p1 : int;
      d0 : int;
      d1 : int;
      is_2D : Extensions.bool;
      dst_type : ggml_type) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1984
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_im2col";

   function ggml_im2col_back
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      ne : access sys_utypes_uint64_t_h.int64_t;
      s0 : int;
      s1 : int;
      p0 : int;
      p1 : int;
      d0 : int;
      d1 : int;
      is_2D : Extensions.bool) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:1997
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_im2col_back";

   function ggml_conv_1d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      s0 : int;
      p0 : int;
      d0 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2010
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_1d";

   function ggml_conv_1d_ph
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      s : int;
      d : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2020
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_1d_ph";

   function ggml_conv_1d_dw
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      s0 : int;
      p0 : int;
      d0 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2029
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_1d_dw";

   function ggml_conv_1d_dw_ph
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      s0 : int;
      d0 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2037
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_1d_dw_ph";

   function ggml_conv_transpose_1d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      s0 : int;
      p0 : int;
      d0 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2044
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_transpose_1d";

   function ggml_conv_2d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      s0 : int;
      s1 : int;
      p0 : int;
      p1 : int;
      d0 : int;
      d1 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2052
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_2d";

   function ggml_im2col_3d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      IC : sys_utypes_uint64_t_h.int64_t;
      s0 : int;
      s1 : int;
      s2 : int;
      p0 : int;
      p1 : int;
      p2 : int;
      d0 : int;
      d1 : int;
      d2 : int;
      dst_type : ggml_type) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2063
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_im2col_3d";

   function ggml_conv_3d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      IC : sys_utypes_uint64_t_h.int64_t;
      s0 : int;
      s1 : int;
      s2 : int;
      p0 : int;
      p1 : int;
      p2 : int;
      d0 : int;
      d1 : int;
      d2 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2082
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_3d";

   function ggml_conv_2d_sk_p0
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2106
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_2d_sk_p0";

   function ggml_conv_2d_s1_ph
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2119
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_2d_s1_ph";

   function ggml_conv_2d_dw
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      s0 : int;
      s1 : int;
      p0 : int;
      p1 : int;
      d0 : int;
      d1 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2125
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_2d_dw";

   function ggml_conv_2d_dw_direct
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      stride0 : int;
      stride1 : int;
      pad0 : int;
      pad1 : int;
      dilation0 : int;
      dilation1 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2141
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_2d_dw_direct";

   function ggml_conv_transpose_2d_p0
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      stride : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2152
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_transpose_2d_p0";

   function ggml_conv_2d_direct
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      s0 : int;
      s1 : int;
      p0 : int;
      p1 : int;
      d0 : int;
      d1 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2158
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_2d_direct";

   function ggml_conv_3d_direct
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      s0 : int;
      s1 : int;
      s2 : int;
      p0 : int;
      p1 : int;
      p2 : int;
      d0 : int;
      d1 : int;
      d2 : int;
      n_channels : int;
      n_batch : int;
      n_channels_out : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2169
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_conv_3d_direct";

   type ggml_op_pool is 
     (GGML_OP_POOL_MAX,
      GGML_OP_POOL_AVG,
      GGML_OP_POOL_COUNT)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2186

   function ggml_pool_1d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      op : ggml_op_pool;
      k0 : int;
      s0 : int;
      p0 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2192
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_pool_1d";

   function ggml_pool_2d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      op : ggml_op_pool;
      k0 : int;
      k1 : int;
      s0 : int;
      s1 : int;
      p0 : float;
      p1 : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2202
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_pool_2d";

   function ggml_pool_2d_back
     (ctx : access ggml_context;
      a : access ggml_tensor;
      af : access ggml_tensor;
      op : ggml_op_pool;
      k0 : int;
      k1 : int;
      s0 : int;
      s1 : int;
      p0 : float;
      p1 : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2213
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_pool_2d_back";

   type ggml_scale_mode is 
     (GGML_SCALE_MODE_NEAREST,
      GGML_SCALE_MODE_BILINEAR,
      GGML_SCALE_MODE_BICUBIC,
      GGML_SCALE_MODE_COUNT)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2225

   subtype ggml_scale_flag is unsigned;
   ggml_scale_flag_GGML_SCALE_FLAG_ALIGN_CORNERS : constant ggml_scale_flag := 256;
   ggml_scale_flag_GGML_SCALE_FLAG_ANTIALIAS : constant ggml_scale_flag := 512;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2233

   function ggml_upscale
     (ctx : access ggml_context;
      a : access ggml_tensor;
      scale_factor : int;
      mode : ggml_scale_mode) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2240
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_upscale";

   function ggml_upscale_ext
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : int;
      ne1 : int;
      ne2 : int;
      ne3 : int;
      mode : ggml_scale_mode) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2248
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_upscale_ext";

   function ggml_interpolate
     (ctx : access ggml_context;
      a : access ggml_tensor;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t;
      ne3 : sys_utypes_uint64_t_h.int64_t;
      mode : utypes_uuint32_t_h.uint32_t) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2260
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_interpolate";

   function ggml_pad
     (ctx : access ggml_context;
      a : access ggml_tensor;
      p0 : int;
      p1 : int;
      p2 : int;
      p3 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2270
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_pad";

   function ggml_pad_circular
     (ctx : access ggml_context;
      a : access ggml_tensor;
      p0 : int;
      p1 : int;
      p2 : int;
      p3 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2279
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_pad_circular";

   function ggml_pad_ext
     (ctx : access ggml_context;
      a : access ggml_tensor;
      lp0 : int;
      rp0 : int;
      lp1 : int;
      rp1 : int;
      lp2 : int;
      rp2 : int;
      lp3 : int;
      rp3 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2287
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_pad_ext";

   function ggml_pad_ext_circular
     (ctx : access ggml_context;
      a : access ggml_tensor;
      lp0 : int;
      rp0 : int;
      lp1 : int;
      rp1 : int;
      lp2 : int;
      rp2 : int;
      lp3 : int;
      rp3 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2301
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_pad_ext_circular";

   function ggml_pad_reflect_1d
     (ctx : access ggml_context;
      a : access ggml_tensor;
      p0 : int;
      p1 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2314
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_pad_reflect_1d";

   function ggml_roll
     (ctx : access ggml_context;
      a : access ggml_tensor;
      shift0 : int;
      shift1 : int;
      shift2 : int;
      shift3 : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2322
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_roll";

   function ggml_tri
     (ctx : access ggml_context;
      a : access ggml_tensor;
      c_type : ggml_tri_type) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2332
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_tri";

   function ggml_fill
     (ctx : access ggml_context;
      a : access ggml_tensor;
      c : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2338
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_fill";

   function ggml_fill_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      c : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2343
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_fill_inplace";

   function ggml_timestep_embedding
     (ctx : access ggml_context;
      timesteps : access ggml_tensor;
      dim : int;
      max_period : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2351
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_timestep_embedding";

   type ggml_sort_order is 
     (GGML_SORT_ORDER_ASC,
      GGML_SORT_ORDER_DESC)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2358

   function ggml_argsort
     (ctx : access ggml_context;
      a : access ggml_tensor;
      order : ggml_sort_order) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2363
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_argsort";

   function ggml_argsort_top_k
     (ctx : access ggml_context;
      a : access ggml_tensor;
      k : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2369
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_argsort_top_k";

   function ggml_top_k
     (ctx : access ggml_context;
      a : access ggml_tensor;
      k : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2376
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_top_k";

   function ggml_arange
     (ctx : access ggml_context;
      start : float;
      stop : float;
      step : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2381
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_arange";

   function ggml_flash_attn_ext
     (ctx : access ggml_context;
      q : access ggml_tensor;
      k : access ggml_tensor;
      v : access ggml_tensor;
      mask : access ggml_tensor;
      scale : float;
      max_bias : float;
      logit_softcap : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2398
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_flash_attn_ext";

   procedure ggml_flash_attn_ext_set_prec (a : access ggml_tensor; prec : ggml_prec)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2408
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_flash_attn_ext_set_prec";

   function ggml_flash_attn_ext_get_prec (a : access constant ggml_tensor) return ggml_prec  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2412
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_flash_attn_ext_get_prec";

   procedure ggml_flash_attn_ext_add_sinks (a : access ggml_tensor; sinks : access ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2415
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_flash_attn_ext_add_sinks";

   function ggml_flash_attn_back
     (ctx : access ggml_context;
      q : access ggml_tensor;
      k : access ggml_tensor;
      v : access ggml_tensor;
      d : access ggml_tensor;
      masked : Extensions.bool) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2420
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_flash_attn_back";

   function ggml_ssm_conv
     (ctx : access ggml_context;
      sx : access ggml_tensor;
      c : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2428
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_ssm_conv";

   function ggml_ssm_scan
     (ctx : access ggml_context;
      s : access ggml_tensor;
      x : access ggml_tensor;
      dt : access ggml_tensor;
      A : access ggml_tensor;
      B : access ggml_tensor;
      C : access ggml_tensor;
      ids : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2433
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_ssm_scan";

   function ggml_win_part
     (ctx : access ggml_context;
      a : access ggml_tensor;
      w : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2449
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_win_part";

   function ggml_win_unpart
     (ctx : access ggml_context;
      a : access ggml_tensor;
      w0 : int;
      h0 : int;
      w : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2456
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_win_unpart";

   function ggml_unary
     (ctx : access ggml_context;
      a : access ggml_tensor;
      op : ggml_unary_op) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2463
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_unary";

   function ggml_unary_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      op : ggml_unary_op) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2468
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_unary_inplace";

   function ggml_get_rel_pos
     (ctx : access ggml_context;
      a : access ggml_tensor;
      qh : int;
      kh : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2474
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_rel_pos";

   function ggml_add_rel_pos
     (ctx : access ggml_context;
      a : access ggml_tensor;
      pw : access ggml_tensor;
      ph : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2481
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_add_rel_pos";

   function ggml_add_rel_pos_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      pw : access ggml_tensor;
      ph : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2487
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_add_rel_pos_inplace";

   function ggml_rwkv_wkv6
     (ctx : access ggml_context;
      k : access ggml_tensor;
      v : access ggml_tensor;
      r : access ggml_tensor;
      tf : access ggml_tensor;
      td : access ggml_tensor;
      state : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2493
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rwkv_wkv6";

   function ggml_gated_linear_attn
     (ctx : access ggml_context;
      k : access ggml_tensor;
      v : access ggml_tensor;
      q : access ggml_tensor;
      g : access ggml_tensor;
      state : access ggml_tensor;
      scale : float) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2502
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gated_linear_attn";

   function ggml_rwkv_wkv7
     (ctx : access ggml_context;
      r : access ggml_tensor;
      w : access ggml_tensor;
      k : access ggml_tensor;
      v : access ggml_tensor;
      a : access ggml_tensor;
      b : access ggml_tensor;
      state : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2511
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_rwkv_wkv7";

   function ggml_solve_tri
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      left : Extensions.bool;
      lower : Extensions.bool;
      uni : Extensions.bool) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2534
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_solve_tri";

   function ggml_gated_delta_net
     (ctx : access ggml_context;
      q : access ggml_tensor;
      k : access ggml_tensor;
      v : access ggml_tensor;
      g : access ggml_tensor;
      beta : access ggml_tensor;
      state : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2549
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_gated_delta_net";

   type ggml_custom1_op_t is access procedure
        (arg1 : access ggml_tensor;
         arg2 : access constant ggml_tensor;
         arg3 : int;
         arg4 : int;
         arg5 : System.Address)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2560

   type ggml_custom2_op_t is access procedure
        (arg1 : access ggml_tensor;
         arg2 : access constant ggml_tensor;
         arg3 : access constant ggml_tensor;
         arg4 : int;
         arg5 : int;
         arg6 : System.Address)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2561

   type ggml_custom3_op_t is access procedure
        (arg1 : access ggml_tensor;
         arg2 : access constant ggml_tensor;
         arg3 : access constant ggml_tensor;
         arg4 : access constant ggml_tensor;
         arg5 : int;
         arg6 : int;
         arg7 : System.Address)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2562

   function ggml_map_custom1
     (ctx : access ggml_context;
      a : access ggml_tensor;
      fun : ggml_custom1_op_t;
      n_tasks : int;
      userdata : System.Address) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2567
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_map_custom1";

   function ggml_map_custom1_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      fun : ggml_custom1_op_t;
      n_tasks : int;
      userdata : System.Address) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2574
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_map_custom1_inplace";

   function ggml_map_custom2
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      fun : ggml_custom2_op_t;
      n_tasks : int;
      userdata : System.Address) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2581
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_map_custom2";

   function ggml_map_custom2_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      fun : ggml_custom2_op_t;
      n_tasks : int;
      userdata : System.Address) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2589
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_map_custom2_inplace";

   function ggml_map_custom3
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor;
      fun : ggml_custom3_op_t;
      n_tasks : int;
      userdata : System.Address) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2597
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_map_custom3";

   function ggml_map_custom3_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor;
      fun : ggml_custom3_op_t;
      n_tasks : int;
      userdata : System.Address) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2606
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_map_custom3_inplace";

   type ggml_custom_op_t is access procedure
        (arg1 : access ggml_tensor;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2615

   function ggml_custom_4d
     (ctx : access ggml_context;
      c_type : ggml_type;
      ne0 : sys_utypes_uint64_t_h.int64_t;
      ne1 : sys_utypes_uint64_t_h.int64_t;
      ne2 : sys_utypes_uint64_t_h.int64_t;
      ne3 : sys_utypes_uint64_t_h.int64_t;
      args : System.Address;
      n_args : int;
      fun : ggml_custom_op_t;
      n_tasks : int;
      userdata : System.Address) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2617
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_custom_4d";

   function ggml_custom_inplace
     (ctx : access ggml_context;
      a : access ggml_tensor;
      args : System.Address;
      n_args : int;
      fun : ggml_custom_op_t;
      n_tasks : int;
      userdata : System.Address) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2630
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_custom_inplace";

   function ggml_cross_entropy_loss
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2641
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cross_entropy_loss";

   function ggml_cross_entropy_loss_back
     (ctx : access ggml_context;
      a : access ggml_tensor;
      b : access ggml_tensor;
      c : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2646
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_cross_entropy_loss_back";

   function ggml_opt_step_adamw
     (ctx : access ggml_context;
      a : access ggml_tensor;
      grad : access ggml_tensor;
      m : access ggml_tensor;
      v : access ggml_tensor;
      adamw_params : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2655
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_step_adamw";

   function ggml_opt_step_sgd
     (ctx : access ggml_context;
      a : access ggml_tensor;
      grad : access ggml_tensor;
      sgd_params : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2664
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_step_sgd";

   function ggml_build_forward_select
     (cgraph : access ggml_cgraph;
      tensors : System.Address;
      n_tensors : int;
      idx : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2696
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_build_forward_select";

   procedure ggml_build_forward_expand (cgraph : access ggml_cgraph; tensor : access ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2702
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_build_forward_expand";

   procedure ggml_build_backward_expand
     (ctx : access ggml_context;
      cgraph : access ggml_cgraph;
      grad_accs : System.Address)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2706
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_build_backward_expand";

   function ggml_new_graph (ctx : access ggml_context) return access ggml_cgraph  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2712
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_new_graph";

   function ggml_new_graph_custom
     (ctx : access ggml_context;
      size : stddef_h.size_t;
      grads : Extensions.bool) return access ggml_cgraph  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2713
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_new_graph_custom";

   function ggml_graph_dup
     (ctx : access ggml_context;
      cgraph : access ggml_cgraph;
      force_grads : Extensions.bool) return access ggml_cgraph  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2714
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_dup";

   procedure ggml_graph_cpy (src : access ggml_cgraph; dst : access ggml_cgraph)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2715
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_cpy";

   procedure ggml_graph_reset (cgraph : access ggml_cgraph)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2716
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_reset";

   procedure ggml_graph_clear (cgraph : access ggml_cgraph)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2717
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_clear";

   function ggml_graph_size (cgraph : access ggml_cgraph) return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2719
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_size";

   function ggml_graph_node (cgraph : access ggml_cgraph; i : int) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2720
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_node";

   function ggml_graph_nodes (cgraph : access ggml_cgraph) return System.Address  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2721
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_nodes";

   function ggml_graph_n_nodes (cgraph : access ggml_cgraph) return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2722
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_n_nodes";

   procedure ggml_graph_add_node (cgraph : access ggml_cgraph; tensor : access ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2724
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_add_node";

   function ggml_graph_overhead return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2726
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_overhead";

   function ggml_graph_overhead_custom (size : stddef_h.size_t; grads : Extensions.bool) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2727
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_overhead_custom";

   function ggml_graph_get_tensor (cgraph : access constant ggml_cgraph; name : Interfaces.C.Strings.chars_ptr) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2729
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_get_tensor";

   function ggml_graph_get_grad (cgraph : access constant ggml_cgraph; node : access constant ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2730
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_get_grad";

   function ggml_graph_get_grad_acc (cgraph : access constant ggml_cgraph; node : access constant ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2731
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_get_grad_acc";

   procedure ggml_graph_print (cgraph : access constant ggml_cgraph)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2734
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_print";

   procedure ggml_graph_dump_dot
     (gb : access constant ggml_cgraph;
      cgraph : access constant ggml_cgraph;
      filename : Interfaces.C.Strings.chars_ptr)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2737
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_graph_dump_dot";

   type ggml_log_callback is access procedure
        (arg1 : ggml_log_level;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : System.Address)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2740

   procedure ggml_log_get (log_callback : System.Address; user_data : System.Address)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2744
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_log_get";

   procedure ggml_log_set (log_callback : ggml_log_callback; user_data : System.Address)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2745
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_log_set";

   function ggml_set_zero (tensor : access ggml_tensor) return access ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2747
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_set_zero";

   procedure ggml_quantize_init (c_type : ggml_type)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2762
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_quantize_init";

   procedure ggml_quantize_free  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2763
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_quantize_free";

   function ggml_quantize_requires_imatrix (c_type : ggml_type) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2766
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_quantize_requires_imatrix";

   function ggml_quantize_chunk
     (c_type : ggml_type;
      src : access float;
      dst : System.Address;
      start : sys_utypes_uint64_t_h.int64_t;
      nrows : sys_utypes_uint64_t_h.int64_t;
      n_per_row : sys_utypes_uint64_t_h.int64_t;
      imatrix : access float) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2769
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_quantize_chunk";

   type ggml_to_float_t is access procedure
        (arg1 : System.Address;
         arg2 : access float;
         arg3 : sys_utypes_uint64_t_h.int64_t)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2796

   type ggml_from_float_t is access procedure
        (arg1 : access float;
         arg2 : System.Address;
         arg3 : sys_utypes_uint64_t_h.int64_t)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2797

   type ggml_type_traits is record
      type_name : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2800
      blck_size : aliased sys_utypes_uint64_t_h.int64_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2801
      blck_size_interleave : aliased sys_utypes_uint64_t_h.int64_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2802
      type_size : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2803
      is_quantized : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2804
      to_float : ggml_to_float_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2805
      from_float_ref : ggml_from_float_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2806
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2799

   function ggml_get_type_traits (c_type : ggml_type) return access constant ggml_type_traits  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2809
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_get_type_traits";

   subtype ggml_sched_priority is int;
   ggml_sched_priority_GGML_SCHED_PRIO_LOW : constant ggml_sched_priority := -1;
   ggml_sched_priority_GGML_SCHED_PRIO_NORMAL : constant ggml_sched_priority := 0;
   ggml_sched_priority_GGML_SCHED_PRIO_MEDIUM : constant ggml_sched_priority := 1;
   ggml_sched_priority_GGML_SCHED_PRIO_HIGH : constant ggml_sched_priority := 2;
   ggml_sched_priority_GGML_SCHED_PRIO_REALTIME : constant ggml_sched_priority := 3;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2816

   type anon_array2249 is array (0 .. 511) of aliased Extensions.bool;
   type ggml_threadpool_params is record
      cpumask : aliased anon_array2249;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2827
      n_threads : aliased int;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2828
      prio : aliased ggml_sched_priority;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2829
      poll : aliased utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2830
      strict_cpu : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2831
      paused : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2832
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2826

   type ggml_threadpool is null record;   -- incomplete struct

   type ggml_threadpool_t is access all ggml_threadpool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2837

   function ggml_threadpool_params_default (n_threads : int) return ggml_threadpool_params  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2839
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_threadpool_params_default";

   procedure ggml_threadpool_params_init (p : access ggml_threadpool_params; n_threads : int)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2840
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_threadpool_params_init";

   function ggml_threadpool_params_match (p0 : access constant ggml_threadpool_params; p1 : access constant ggml_threadpool_params) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml.h:2841
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_threadpool_params_match";

end ggml_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
