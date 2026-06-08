pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with sys_utypes_uint32_t_h;
with Interfaces.C.Strings;
with stddef_h;
with sys_utypes_uint64_t_h;
with Interfaces.C.Extensions;
with System;
with sys_utypes_uint8_t_h;
with ggml_backend_h;
with utypes_uuint32_t_h;
with ggml_h;
with ggml_cpu_h;
limited with gguf_h;
with utypes_uuint64_t_h;
with utypes_uuint8_t_h;
with ggml_opt_h;

package llama_h is

   --  arg-macro: procedure DEPRECATED (func, hint)
   --    func __attribute__((deprecated(hint)))
   LLAMA_DEFAULT_SEED : constant := 16#FFFFFFFF#;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:37

   LLAMA_TOKEN_NULL : constant := -1;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:39

   LLAMA_FILE_MAGIC_GGLA : constant := 16#67676c61#;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:41
   LLAMA_FILE_MAGIC_GGSN : constant := 16#6767736e#;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:42
   LLAMA_FILE_MAGIC_GGSQ : constant := 16#67677371#;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:43
   --  unsupported macro: LLAMA_SESSION_MAGIC LLAMA_FILE_MAGIC_GGSN

   LLAMA_SESSION_VERSION : constant := 9;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:46
   --  unsupported macro: LLAMA_STATE_SEQ_MAGIC LLAMA_FILE_MAGIC_GGSQ

   LLAMA_STATE_SEQ_VERSION : constant := 2;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:49

   LLAMA_STATE_SEQ_FLAGS_NONE : constant := 0;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:870

   LLAMA_STATE_SEQ_FLAGS_SWA_ONLY : constant := 1;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:873

   LLAMA_STATE_SEQ_FLAGS_PARTIAL_ONLY : constant := 1;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:876

   LLAMA_STATE_SEQ_FLAGS_ON_DEVICE : constant := 2;  --  /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:880

   type llama_vocab is null record;   -- incomplete struct

   type llama_model is null record;   -- incomplete struct

   type llama_context is null record;   -- incomplete struct

   type llama_memory_i is null record;   -- incomplete struct

   type llama_memory_t is access all llama_memory_i;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:66

   subtype llama_pos is sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:68

   subtype llama_token is sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:69

   subtype llama_seq_id is sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:70

   type llama_vocab_type is 
     (LLAMA_VOCAB_TYPE_NONE,
      LLAMA_VOCAB_TYPE_SPM,
      LLAMA_VOCAB_TYPE_BPE,
      LLAMA_VOCAB_TYPE_WPM,
      LLAMA_VOCAB_TYPE_UGM,
      LLAMA_VOCAB_TYPE_RWKV,
      LLAMA_VOCAB_TYPE_PLAMO2)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:72

   subtype llama_rope_type is int;
   llama_rope_type_LLAMA_ROPE_TYPE_NONE : constant llama_rope_type := -1;
   llama_rope_type_LLAMA_ROPE_TYPE_NORM : constant llama_rope_type := 0;
   llama_rope_type_LLAMA_ROPE_TYPE_NEOX : constant llama_rope_type := 2;
   llama_rope_type_LLAMA_ROPE_TYPE_MROPE : constant llama_rope_type := 8;
   llama_rope_type_LLAMA_ROPE_TYPE_IMROPE : constant llama_rope_type := 40;
   llama_rope_type_LLAMA_ROPE_TYPE_VISION : constant llama_rope_type := 24;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:82

   type llama_token_type is 
     (LLAMA_TOKEN_TYPE_UNDEFINED,
      LLAMA_TOKEN_TYPE_NORMAL,
      LLAMA_TOKEN_TYPE_UNKNOWN,
      LLAMA_TOKEN_TYPE_CONTROL,
      LLAMA_TOKEN_TYPE_USER_DEFINED,
      LLAMA_TOKEN_TYPE_UNUSED,
      LLAMA_TOKEN_TYPE_BYTE)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:91

   subtype llama_token_attr is unsigned;
   llama_token_attr_LLAMA_TOKEN_ATTR_UNDEFINED : constant llama_token_attr := 0;
   llama_token_attr_LLAMA_TOKEN_ATTR_UNKNOWN : constant llama_token_attr := 1;
   llama_token_attr_LLAMA_TOKEN_ATTR_UNUSED : constant llama_token_attr := 2;
   llama_token_attr_LLAMA_TOKEN_ATTR_NORMAL : constant llama_token_attr := 4;
   llama_token_attr_LLAMA_TOKEN_ATTR_CONTROL : constant llama_token_attr := 8;
   llama_token_attr_LLAMA_TOKEN_ATTR_USER_DEFINED : constant llama_token_attr := 16;
   llama_token_attr_LLAMA_TOKEN_ATTR_BYTE : constant llama_token_attr := 32;
   llama_token_attr_LLAMA_TOKEN_ATTR_NORMALIZED : constant llama_token_attr := 64;
   llama_token_attr_LLAMA_TOKEN_ATTR_LSTRIP : constant llama_token_attr := 128;
   llama_token_attr_LLAMA_TOKEN_ATTR_RSTRIP : constant llama_token_attr := 256;
   llama_token_attr_LLAMA_TOKEN_ATTR_SINGLE_WORD : constant llama_token_attr := 512;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:101

   subtype llama_ftype is unsigned;
   llama_ftype_LLAMA_FTYPE_ALL_F32 : constant llama_ftype := 0;
   llama_ftype_LLAMA_FTYPE_MOSTLY_F16 : constant llama_ftype := 1;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q4_0 : constant llama_ftype := 2;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q4_1 : constant llama_ftype := 3;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q8_0 : constant llama_ftype := 7;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q5_0 : constant llama_ftype := 8;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q5_1 : constant llama_ftype := 9;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q2_K : constant llama_ftype := 10;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q3_K_S : constant llama_ftype := 11;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q3_K_M : constant llama_ftype := 12;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q3_K_L : constant llama_ftype := 13;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q4_K_S : constant llama_ftype := 14;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q4_K_M : constant llama_ftype := 15;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q5_K_S : constant llama_ftype := 16;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q5_K_M : constant llama_ftype := 17;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q6_K : constant llama_ftype := 18;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ2_XXS : constant llama_ftype := 19;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ2_XS : constant llama_ftype := 20;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q2_K_S : constant llama_ftype := 21;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ3_XS : constant llama_ftype := 22;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ3_XXS : constant llama_ftype := 23;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ1_S : constant llama_ftype := 24;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ4_NL : constant llama_ftype := 25;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ3_S : constant llama_ftype := 26;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ3_M : constant llama_ftype := 27;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ2_S : constant llama_ftype := 28;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ2_M : constant llama_ftype := 29;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ4_XS : constant llama_ftype := 30;
   llama_ftype_LLAMA_FTYPE_MOSTLY_IQ1_M : constant llama_ftype := 31;
   llama_ftype_LLAMA_FTYPE_MOSTLY_BF16 : constant llama_ftype := 32;
   llama_ftype_LLAMA_FTYPE_MOSTLY_TQ1_0 : constant llama_ftype := 36;
   llama_ftype_LLAMA_FTYPE_MOSTLY_TQ2_0 : constant llama_ftype := 37;
   llama_ftype_LLAMA_FTYPE_MOSTLY_MXFP4_MOE : constant llama_ftype := 38;
   llama_ftype_LLAMA_FTYPE_MOSTLY_NVFP4 : constant llama_ftype := 39;
   llama_ftype_LLAMA_FTYPE_MOSTLY_Q1_0 : constant llama_ftype := 40;
   llama_ftype_LLAMA_FTYPE_GUESSED : constant llama_ftype := 1024;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:116

   subtype llama_rope_scaling_type is int;
   llama_rope_scaling_type_LLAMA_ROPE_SCALING_TYPE_UNSPECIFIED : constant llama_rope_scaling_type := -1;
   llama_rope_scaling_type_LLAMA_ROPE_SCALING_TYPE_NONE : constant llama_rope_scaling_type := 0;
   llama_rope_scaling_type_LLAMA_ROPE_SCALING_TYPE_LINEAR : constant llama_rope_scaling_type := 1;
   llama_rope_scaling_type_LLAMA_ROPE_SCALING_TYPE_YARN : constant llama_rope_scaling_type := 2;
   llama_rope_scaling_type_LLAMA_ROPE_SCALING_TYPE_LONGROPE : constant llama_rope_scaling_type := 3;
   llama_rope_scaling_type_LLAMA_ROPE_SCALING_TYPE_MAX_VALUE : constant llama_rope_scaling_type := 3;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:162

   subtype llama_pooling_type is int;
   llama_pooling_type_LLAMA_POOLING_TYPE_UNSPECIFIED : constant llama_pooling_type := -1;
   llama_pooling_type_LLAMA_POOLING_TYPE_NONE : constant llama_pooling_type := 0;
   llama_pooling_type_LLAMA_POOLING_TYPE_MEAN : constant llama_pooling_type := 1;
   llama_pooling_type_LLAMA_POOLING_TYPE_CLS : constant llama_pooling_type := 2;
   llama_pooling_type_LLAMA_POOLING_TYPE_LAST : constant llama_pooling_type := 3;
   llama_pooling_type_LLAMA_POOLING_TYPE_RANK : constant llama_pooling_type := 4;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:171

   subtype llama_attention_type is int;
   llama_attention_type_LLAMA_ATTENTION_TYPE_UNSPECIFIED : constant llama_attention_type := -1;
   llama_attention_type_LLAMA_ATTENTION_TYPE_CAUSAL : constant llama_attention_type := 0;
   llama_attention_type_LLAMA_ATTENTION_TYPE_NON_CAUSAL : constant llama_attention_type := 1;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:180

   subtype llama_flash_attn_type is int;
   llama_flash_attn_type_LLAMA_FLASH_ATTN_TYPE_AUTO : constant llama_flash_attn_type := -1;
   llama_flash_attn_type_LLAMA_FLASH_ATTN_TYPE_DISABLED : constant llama_flash_attn_type := 0;
   llama_flash_attn_type_LLAMA_FLASH_ATTN_TYPE_ENABLED : constant llama_flash_attn_type := 1;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:186

   function llama_flash_attn_type_name (flash_attn_type : llama_flash_attn_type) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:192
   with Import => True, 
        Convention => C, 
        External_Name => "llama_flash_attn_type_name";

   type llama_split_mode is 
     (LLAMA_SPLIT_MODE_NONE,
      LLAMA_SPLIT_MODE_LAYER,
      LLAMA_SPLIT_MODE_ROW,
      LLAMA_SPLIT_MODE_TENSOR)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:194

   type llama_context_type is 
     (LLAMA_CONTEXT_TYPE_DEFAULT,
      LLAMA_CONTEXT_TYPE_MTP)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:201

   type llama_token_data is record
      id : aliased llama_token;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:208
      logit : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:209
      p : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:210
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:207

   type llama_token_data_array is record
      data : access llama_token_data;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:216
      size : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:217
      selected : aliased sys_utypes_uint64_t_h.int64_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:218
      sorted : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:219
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:213

   type llama_progress_callback is access function (arg1 : float; arg2 : System.Address) return Extensions.bool
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:222

   type llama_batch is record
      n_tokens : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:241
      token : access llama_token;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:243
      embd : access float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:244
      pos : access llama_pos;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:245
      n_seq_id : access sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:246
      seq_id : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:247
      logits : access sys_utypes_uint8_t_h.int8_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:248
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:240

   type llama_model_kv_override_type is 
     (LLAMA_KV_OVERRIDE_TYPE_INT,
      LLAMA_KV_OVERRIDE_TYPE_FLOAT,
      LLAMA_KV_OVERRIDE_TYPE_BOOL,
      LLAMA_KV_OVERRIDE_TYPE_STR)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:251

   type llama_model_meta_key is 
     (LLAMA_MODEL_META_KEY_SAMPLING_SEQUENCE,
      LLAMA_MODEL_META_KEY_SAMPLING_TOP_K,
      LLAMA_MODEL_META_KEY_SAMPLING_TOP_P,
      LLAMA_MODEL_META_KEY_SAMPLING_MIN_P,
      LLAMA_MODEL_META_KEY_SAMPLING_XTC_PROBABILITY,
      LLAMA_MODEL_META_KEY_SAMPLING_XTC_THRESHOLD,
      LLAMA_MODEL_META_KEY_SAMPLING_TEMP,
      LLAMA_MODEL_META_KEY_SAMPLING_PENALTY_LAST_N,
      LLAMA_MODEL_META_KEY_SAMPLING_PENALTY_REPEAT,
      LLAMA_MODEL_META_KEY_SAMPLING_MIROSTAT,
      LLAMA_MODEL_META_KEY_SAMPLING_MIROSTAT_TAU,
      LLAMA_MODEL_META_KEY_SAMPLING_MIROSTAT_ETA)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:258

   subtype anon_array1744 is Interfaces.C.char_array (0 .. 127);
   type anon_anon_5 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            val_i64 : aliased sys_utypes_uint64_t_h.int64_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:279
         when 1 =>
            val_f64 : aliased double;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:280
         when 2 =>
            val_bool : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:281
         when others =>
            val_str : aliased anon_array1744;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:282
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type llama_model_kv_override is record
      tag : aliased llama_model_kv_override_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:274
      key : aliased anon_array1744;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:276
      field_3 : aliased anon_anon_5;
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:273

   type llama_model_tensor_buft_override is record
      pattern : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:287
      buft : ggml_backend_h.ggml_backend_buffer_type_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:288
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:286

   type llama_model_params is record
      devices : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:293
      tensor_buft_overrides : access constant llama_model_tensor_buft_override;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:296
      n_gpu_layers : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:298
      split_mode : aliased llama_split_mode;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:299
      main_gpu : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:302
      tensor_split : access float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:305
      progress_callback : llama_progress_callback;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:310
      progress_callback_user_data : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:313
      kv_overrides : access constant llama_model_kv_override;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:316
      vocab_only : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:319
      use_mmap : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:320
      use_direct_io : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:321
      use_mlock : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:322
      check_tensors : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:323
      use_extra_bufts : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:324
      no_host : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:325
      no_alloc : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:326
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:291

   type llama_sampler;
   type llama_sampler_seq_config is record
      seq_id : aliased llama_seq_id;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:330
      sampler : access llama_sampler;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:331
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:329

   type llama_context_params is record
      n_ctx : aliased utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:337
      n_batch : aliased utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:338
      n_ubatch : aliased utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:339
      n_seq_max : aliased utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:340
      n_rs_seq : aliased utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:341
      n_outputs_max : aliased utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:342
      n_threads : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:343
      n_threads_batch : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:344
      ctx_type : aliased llama_context_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:346
      rope_scaling_type : aliased llama_rope_scaling_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:347
      pooling_type : aliased llama_pooling_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:348
      attention_type : aliased llama_attention_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:349
      flash_attn_type : aliased llama_flash_attn_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:350
      rope_freq_base : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:353
      rope_freq_scale : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:354
      yarn_ext_factor : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:355
      yarn_attn_factor : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:356
      yarn_beta_fast : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:357
      yarn_beta_slow : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:358
      yarn_orig_ctx : aliased utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:359
      defrag_thold : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:360
      cb_eval : ggml_backend_h.ggml_backend_sched_eval_callback;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:362
      cb_eval_user_data : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:363
      type_k : aliased ggml_h.ggml_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:365
      type_v : aliased ggml_h.ggml_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:366
      abort_callback : ggml_h.ggml_abort_callback;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:371
      abort_callback_data : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:372
      embeddings : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:375
      offload_kqv : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:376
      no_perf : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:377
      op_offload : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:378
      swa_full : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:379
      kv_unified : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:382
      samplers : access llama_sampler_seq_config;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:389
      n_samplers : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:390
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:336

   type llama_model_tensor_override is record
      pattern : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:394
      c_type : aliased ggml_h.ggml_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:395
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:393

   type llama_model_imatrix_data is record
      name : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:399
      data : access float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:400
      size : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:401
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:398

   type llama_model_quantize_params is record
      nthread : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:406
      ftype : aliased llama_ftype;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:407
      output_tensor_type : aliased ggml_h.ggml_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:408
      token_embedding_type : aliased ggml_h.ggml_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:409
      allow_requantize : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:410
      quantize_output_tensor : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:411
      only_copy : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:412
      pure : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:413
      keep_split : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:414
      dry_run : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:415
      imatrix : access constant llama_model_imatrix_data;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:416
      kv_overrides : access constant llama_model_kv_override;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:417
      tt_overrides : access constant llama_model_tensor_override;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:418
      prune_layers : access sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:419
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:405

   type llama_logit_bias is record
      token : aliased llama_token;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:423
      bias : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:424
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:422

   type llama_sampler_chain_params is record
      no_perf : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:428
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:427

   type llama_chat_message is record
      role : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:433
      content : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:434
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:432

   type llama_adapter_lora is null record;   -- incomplete struct

   function llama_model_default_params return llama_model_params  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:442
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_default_params";

   function llama_context_default_params return llama_context_params  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:443
   with Import => True, 
        Convention => C, 
        External_Name => "llama_context_default_params";

   function llama_sampler_chain_default_params return llama_sampler_chain_params  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:444
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_chain_default_params";

   function llama_model_quantize_default_params return llama_model_quantize_params  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:445
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_quantize_default_params";

   procedure llama_backend_init  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:450
   with Import => True, 
        Convention => C, 
        External_Name => "llama_backend_init";

   procedure llama_backend_free  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:453
   with Import => True, 
        Convention => C, 
        External_Name => "llama_backend_free";

   procedure llama_numa_init (numa : ggml_cpu_h.ggml_numa_strategy)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:456
   with Import => True, 
        Convention => C, 
        External_Name => "llama_numa_init";

   procedure llama_attach_threadpool
     (ctx : access llama_context;
      threadpool : ggml_h.ggml_threadpool_t;
      threadpool_batch : ggml_h.ggml_threadpool_t)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:459
   with Import => True, 
        Convention => C, 
        External_Name => "llama_attach_threadpool";

   procedure llama_detach_threadpool (ctx : access llama_context)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:464
   with Import => True, 
        Convention => C, 
        External_Name => "llama_detach_threadpool";

   type llama_model_set_tensor_data_t is access procedure (arg1 : access ggml_h.ggml_tensor; arg2 : System.Address)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:466

   function llama_model_init_from_user
     (metadata : access gguf_h.gguf_context;
      set_tensor_data : llama_model_set_tensor_data_t;
      set_tensor_data_ud : System.Address;
      params : llama_model_params) return access llama_model  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:471
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_init_from_user";

   function llama_load_model_from_file (path_model : Interfaces.C.Strings.chars_ptr; params : llama_model_params) return access llama_model  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:477
   with Import => True, 
        Convention => C, 
        External_Name => "llama_load_model_from_file";

   function llama_model_load_from_file (path_model : Interfaces.C.Strings.chars_ptr; params : llama_model_params) return access llama_model  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:485
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_load_from_file";

   llama_model_load_from_file_ptr : access llama_model  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:490
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_load_from_file_ptr";

   function llama_model_load_from_splits
     (paths : System.Address;
      n_paths : stddef_h.size_t;
      params : llama_model_params) return access llama_model  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:496
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_load_from_splits";

   procedure llama_model_save_to_file (model : access constant llama_model; path_model : Interfaces.C.Strings.chars_ptr)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:501
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_save_to_file";

   procedure llama_free_model (model : access llama_model)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:505
   with Import => True, 
        Convention => C, 
        External_Name => "llama_free_model";

   procedure llama_model_free (model : access llama_model)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:508
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_free";

   function llama_init_from_model (model : access llama_model; params : llama_context_params) return access llama_context  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:510
   with Import => True, 
        Convention => C, 
        External_Name => "llama_init_from_model";

   function llama_new_context_with_model (model : access llama_model; params : llama_context_params) return access llama_context  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:514
   with Import => True, 
        Convention => C, 
        External_Name => "llama_new_context_with_model";

   procedure llama_free (ctx : access llama_context)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:520
   with Import => True, 
        Convention => C, 
        External_Name => "llama_free";

   function llama_time_us return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:522
   with Import => True, 
        Convention => C, 
        External_Name => "llama_time_us";

   function llama_max_devices return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:524
   with Import => True, 
        Convention => C, 
        External_Name => "llama_max_devices";

   function llama_max_parallel_sequences return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:525
   with Import => True, 
        Convention => C, 
        External_Name => "llama_max_parallel_sequences";

   function llama_max_tensor_buft_overrides return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:526
   with Import => True, 
        Convention => C, 
        External_Name => "llama_max_tensor_buft_overrides";

   function llama_supports_mmap return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:528
   with Import => True, 
        Convention => C, 
        External_Name => "llama_supports_mmap";

   function llama_supports_mlock return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:529
   with Import => True, 
        Convention => C, 
        External_Name => "llama_supports_mlock";

   function llama_supports_gpu_offload return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:530
   with Import => True, 
        Convention => C, 
        External_Name => "llama_supports_gpu_offload";

   function llama_supports_rpc return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:531
   with Import => True, 
        Convention => C, 
        External_Name => "llama_supports_rpc";

   function llama_n_ctx (ctx : access constant llama_context) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:536
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_ctx";

   function llama_n_ctx_seq (ctx : access constant llama_context) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:537
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_ctx_seq";

   function llama_n_batch (ctx : access constant llama_context) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:538
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_batch";

   function llama_n_ubatch (ctx : access constant llama_context) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:539
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_ubatch";

   function llama_n_seq_max (ctx : access constant llama_context) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:540
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_seq_max";

   function llama_n_rs_seq (ctx : access constant llama_context) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:541
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_rs_seq";

   function llama_n_ctx_train (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:543
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_ctx_train";

   function llama_n_embd (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:544
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_embd";

   function llama_n_layer (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:545
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_layer";

   function llama_n_head (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:546
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_head";

   function llama_n_vocab (vocab : access constant llama_vocab) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:548
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_vocab";

   function llama_get_model (ctx : access constant llama_context) return access constant llama_model  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:550
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_model";

   function llama_get_memory (ctx : access constant llama_context) return llama_memory_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:551
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_memory";

   function llama_pooling_type_f (ctx : access constant llama_context) return llama_pooling_type  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:552
   with Import => True, 
        Convention => C, 
        External_Name => "llama_pooling_type";

   function llama_model_get_vocab (model : access constant llama_model) return access constant llama_vocab  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_get_vocab";

   function llama_model_rope_type (model : access constant llama_model) return llama_rope_type  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:555
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_rope_type";

   function llama_model_n_ctx_train (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:557
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_n_ctx_train";

   function llama_model_n_embd (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:558
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_n_embd";

   function llama_model_n_embd_inp (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:559
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_n_embd_inp";

   function llama_model_n_embd_out (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:560
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_n_embd_out";

   function llama_model_n_layer (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:561
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_n_layer";

   function llama_model_n_head (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:562
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_n_head";

   function llama_model_n_head_kv (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:563
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_n_head_kv";

   function llama_model_n_swa (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:564
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_n_swa";

   function llama_model_rope_freq_scale_train (model : access constant llama_model) return float  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:567
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_rope_freq_scale_train";

   function llama_model_n_cls_out (model : access constant llama_model) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:571
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_n_cls_out";

   function llama_model_cls_label (model : access constant llama_model; i : utypes_uuint32_t_h.uint32_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:574
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_cls_label";

   function llama_vocab_type_f (vocab : access constant llama_vocab) return llama_vocab_type  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:576
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_type";

   function llama_vocab_n_tokens (vocab : access constant llama_vocab) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:578
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_n_tokens";

   function llama_model_meta_val_str
     (model : access constant llama_model;
      key : Interfaces.C.Strings.chars_ptr;
      buf : Interfaces.C.Strings.chars_ptr;
      buf_size : stddef_h.size_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:587
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_meta_val_str";

   function llama_model_meta_count (model : access constant llama_model) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:590
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_meta_count";

   function llama_model_meta_key_str (key : llama_model_meta_key) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:593
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_meta_key_str";

   function llama_model_meta_key_by_index
     (model : access constant llama_model;
      i : sys_utypes_uint32_t_h.int32_t;
      buf : Interfaces.C.Strings.chars_ptr;
      buf_size : stddef_h.size_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:596
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_meta_key_by_index";

   function llama_model_meta_val_str_by_index
     (model : access constant llama_model;
      i : sys_utypes_uint32_t_h.int32_t;
      buf : Interfaces.C.Strings.chars_ptr;
      buf_size : stddef_h.size_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:599
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_meta_val_str_by_index";

   function llama_model_desc
     (model : access constant llama_model;
      buf : Interfaces.C.Strings.chars_ptr;
      buf_size : stddef_h.size_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:602
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_desc";

   function llama_model_size (model : access constant llama_model) return utypes_uuint64_t_h.uint64_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:605
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_size";

   function llama_model_chat_template (model : access constant llama_model; name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:609
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_chat_template";

   function llama_model_n_params (model : access constant llama_model) return utypes_uuint64_t_h.uint64_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:612
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_n_params";

   function llama_model_has_encoder (model : access constant llama_model) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:615
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_has_encoder";

   function llama_model_has_decoder (model : access constant llama_model) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:618
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_has_decoder";

   function llama_model_decoder_start_token (model : access constant llama_model) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:622
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_decoder_start_token";

   function llama_model_is_recurrent (model : access constant llama_model) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:625
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_is_recurrent";

   function llama_model_is_hybrid (model : access constant llama_model) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:628
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_is_hybrid";

   function llama_model_is_diffusion (model : access constant llama_model) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:631
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_is_diffusion";

   function llama_model_quantize
     (fname_inp : Interfaces.C.Strings.chars_ptr;
      fname_out : Interfaces.C.Strings.chars_ptr;
      params : access constant llama_model_quantize_params) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:634
   with Import => True, 
        Convention => C, 
        External_Name => "llama_model_quantize";

   function llama_adapter_lora_init (model : access llama_model; path_lora : Interfaces.C.Strings.chars_ptr) return access llama_adapter_lora  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:645
   with Import => True, 
        Convention => C, 
        External_Name => "llama_adapter_lora_init";

   function llama_adapter_meta_val_str
     (adapter : access constant llama_adapter_lora;
      key : Interfaces.C.Strings.chars_ptr;
      buf : Interfaces.C.Strings.chars_ptr;
      buf_size : stddef_h.size_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:656
   with Import => True, 
        Convention => C, 
        External_Name => "llama_adapter_meta_val_str";

   function llama_adapter_meta_count (adapter : access constant llama_adapter_lora) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:659
   with Import => True, 
        Convention => C, 
        External_Name => "llama_adapter_meta_count";

   function llama_adapter_meta_key_by_index
     (adapter : access constant llama_adapter_lora;
      i : sys_utypes_uint32_t_h.int32_t;
      buf : Interfaces.C.Strings.chars_ptr;
      buf_size : stddef_h.size_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:662
   with Import => True, 
        Convention => C, 
        External_Name => "llama_adapter_meta_key_by_index";

   function llama_adapter_meta_val_str_by_index
     (adapter : access constant llama_adapter_lora;
      i : sys_utypes_uint32_t_h.int32_t;
      buf : Interfaces.C.Strings.chars_ptr;
      buf_size : stddef_h.size_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:665
   with Import => True, 
        Convention => C, 
        External_Name => "llama_adapter_meta_val_str_by_index";

   procedure llama_adapter_lora_free (adapter : access llama_adapter_lora)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:669
   with Import => True, 
        Convention => C, 
        External_Name => "llama_adapter_lora_free";

   function llama_adapter_get_alora_n_invocation_tokens (adapter : access constant llama_adapter_lora) return utypes_uuint64_t_h.uint64_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:672
   with Import => True, 
        Convention => C, 
        External_Name => "llama_adapter_get_alora_n_invocation_tokens";

   function llama_adapter_get_alora_invocation_tokens (adapter : access constant llama_adapter_lora) return access llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:673
   with Import => True, 
        Convention => C, 
        External_Name => "llama_adapter_get_alora_invocation_tokens";

   function llama_set_adapters_lora
     (ctx : access llama_context;
      adapters : System.Address;
      n_adapters : stddef_h.size_t;
      scales : access float) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:678
   with Import => True, 
        Convention => C, 
        External_Name => "llama_set_adapters_lora";

   function llama_set_adapter_cvec
     (ctx : access llama_context;
      data : access float;
      len : stddef_h.size_t;
      n_embd : sys_utypes_uint32_t_h.int32_t;
      il_start : sys_utypes_uint32_t_h.int32_t;
      il_end : sys_utypes_uint32_t_h.int32_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:690
   with Import => True, 
        Convention => C, 
        External_Name => "llama_set_adapter_cvec";

   procedure llama_memory_clear (mem : llama_memory_t; data : Extensions.bool)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:704
   with Import => True, 
        Convention => C, 
        External_Name => "llama_memory_clear";

   function llama_memory_seq_rm
     (mem : llama_memory_t;
      seq_id : llama_seq_id;
      p0 : llama_pos;
      p1 : llama_pos) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:713
   with Import => True, 
        Convention => C, 
        External_Name => "llama_memory_seq_rm";

   procedure llama_memory_seq_cp
     (mem : llama_memory_t;
      seq_id_src : llama_seq_id;
      seq_id_dst : llama_seq_id;
      p0 : llama_pos;
      p1 : llama_pos)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:722
   with Import => True, 
        Convention => C, 
        External_Name => "llama_memory_seq_cp";

   procedure llama_memory_seq_keep (mem : llama_memory_t; seq_id : llama_seq_id)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:730
   with Import => True, 
        Convention => C, 
        External_Name => "llama_memory_seq_keep";

   procedure llama_memory_seq_add
     (mem : llama_memory_t;
      seq_id : llama_seq_id;
      p0 : llama_pos;
      p1 : llama_pos;
      c_delta : llama_pos)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:737
   with Import => True, 
        Convention => C, 
        External_Name => "llama_memory_seq_add";

   procedure llama_memory_seq_div
     (mem : llama_memory_t;
      seq_id : llama_seq_id;
      p0 : llama_pos;
      p1 : llama_pos;
      d : int)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:747
   with Import => True, 
        Convention => C, 
        External_Name => "llama_memory_seq_div";

   function llama_memory_seq_pos_min (mem : llama_memory_t; seq_id : llama_seq_id) return llama_pos  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:758
   with Import => True, 
        Convention => C, 
        External_Name => "llama_memory_seq_pos_min";

   function llama_memory_seq_pos_max (mem : llama_memory_t; seq_id : llama_seq_id) return llama_pos  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:765
   with Import => True, 
        Convention => C, 
        External_Name => "llama_memory_seq_pos_max";

   function llama_memory_can_shift (mem : llama_memory_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:770
   with Import => True, 
        Convention => C, 
        External_Name => "llama_memory_can_shift";

   function llama_state_get_size (ctx : access llama_context) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:779
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_get_size";

   function llama_get_state_size (ctx : access llama_context) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:780
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_state_size";

   function llama_state_get_data
     (ctx : access llama_context;
      dst : access utypes_uuint8_t_h.uint8_t;
      size : stddef_h.size_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:786
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_get_data";

   function llama_copy_state_data (ctx : access llama_context; dst : access utypes_uuint8_t_h.uint8_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:790
   with Import => True, 
        Convention => C, 
        External_Name => "llama_copy_state_data";

   function llama_state_set_data
     (ctx : access llama_context;
      src : access utypes_uuint8_t_h.uint8_t;
      size : stddef_h.size_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:797
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_set_data";

   function llama_set_state_data (ctx : access llama_context; src : access utypes_uuint8_t_h.uint8_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:801
   with Import => True, 
        Convention => C, 
        External_Name => "llama_set_state_data";

   function llama_state_load_file
     (ctx : access llama_context;
      path_session : Interfaces.C.Strings.chars_ptr;
      tokens_out : access llama_token;
      n_token_capacity : stddef_h.size_t;
      n_token_count_out : access stddef_h.size_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:807
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_load_file";

   function llama_load_session_file
     (ctx : access llama_context;
      path_session : Interfaces.C.Strings.chars_ptr;
      tokens_out : access llama_token;
      n_token_capacity : stddef_h.size_t;
      n_token_count_out : access stddef_h.size_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:813
   with Import => True, 
        Convention => C, 
        External_Name => "llama_load_session_file";

   function llama_state_save_file
     (ctx : access llama_context;
      path_session : Interfaces.C.Strings.chars_ptr;
      tokens : access llama_token;
      n_token_count : stddef_h.size_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:821
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_save_file";

   function llama_save_session_file
     (ctx : access llama_context;
      path_session : Interfaces.C.Strings.chars_ptr;
      tokens : access llama_token;
      n_token_count : stddef_h.size_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:826
   with Import => True, 
        Convention => C, 
        External_Name => "llama_save_session_file";

   function llama_state_seq_get_size (ctx : access llama_context; seq_id : llama_seq_id) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:834
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_seq_get_size";

   function llama_state_seq_get_data
     (ctx : access llama_context;
      dst : access utypes_uuint8_t_h.uint8_t;
      size : stddef_h.size_t;
      seq_id : llama_seq_id) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:839
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_seq_get_data";

   function llama_state_seq_set_data
     (ctx : access llama_context;
      src : access utypes_uuint8_t_h.uint8_t;
      size : stddef_h.size_t;
      dest_seq_id : llama_seq_id) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:849
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_seq_set_data";

   function llama_state_seq_save_file
     (ctx : access llama_context;
      filepath : Interfaces.C.Strings.chars_ptr;
      seq_id : llama_seq_id;
      tokens : access llama_token;
      n_token_count : stddef_h.size_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:855
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_seq_save_file";

   function llama_state_seq_load_file
     (ctx : access llama_context;
      filepath : Interfaces.C.Strings.chars_ptr;
      dest_seq_id : llama_seq_id;
      tokens_out : access llama_token;
      n_token_capacity : stddef_h.size_t;
      n_token_count_out : access stddef_h.size_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:862
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_seq_load_file";

   subtype llama_state_seq_flags is utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:882

   function llama_state_seq_get_size_ext
     (ctx : access llama_context;
      seq_id : llama_seq_id;
      flags : llama_state_seq_flags) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:884
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_seq_get_size_ext";

   function llama_state_seq_get_data_ext
     (ctx : access llama_context;
      dst : access utypes_uuint8_t_h.uint8_t;
      size : stddef_h.size_t;
      seq_id : llama_seq_id;
      flags : llama_state_seq_flags) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:889
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_seq_get_data_ext";

   function llama_state_seq_set_data_ext
     (ctx : access llama_context;
      src : access utypes_uuint8_t_h.uint8_t;
      size : stddef_h.size_t;
      dest_seq_id : llama_seq_id;
      flags : llama_state_seq_flags) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:896
   with Import => True, 
        Convention => C, 
        External_Name => "llama_state_seq_set_data_ext";

   function llama_batch_get_one (tokens : access llama_token; n_tokens : sys_utypes_uint32_t_h.int32_t) return llama_batch  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:913
   with Import => True, 
        Convention => C, 
        External_Name => "llama_batch_get_one";

   function llama_batch_init
     (n_tokens : sys_utypes_uint32_t_h.int32_t;
      embd : sys_utypes_uint32_t_h.int32_t;
      n_seq_max : sys_utypes_uint32_t_h.int32_t) return llama_batch  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:924
   with Import => True, 
        Convention => C, 
        External_Name => "llama_batch_init";

   procedure llama_batch_free (batch : llama_batch)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:930
   with Import => True, 
        Convention => C, 
        External_Name => "llama_batch_free";

   function llama_encode (ctx : access llama_context; batch : llama_batch) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:938
   with Import => True, 
        Convention => C, 
        External_Name => "llama_encode";

   function llama_decode (ctx : access llama_context; batch : llama_batch) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:954
   with Import => True, 
        Convention => C, 
        External_Name => "llama_decode";

   procedure llama_set_n_threads
     (ctx : access llama_context;
      n_threads : sys_utypes_uint32_t_h.int32_t;
      n_threads_batch : sys_utypes_uint32_t_h.int32_t)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:961
   with Import => True, 
        Convention => C, 
        External_Name => "llama_set_n_threads";

   function llama_n_threads (ctx : access llama_context) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:964
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_threads";

   function llama_n_threads_batch (ctx : access llama_context) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:967
   with Import => True, 
        Convention => C, 
        External_Name => "llama_n_threads_batch";

   procedure llama_set_embeddings (ctx : access llama_context; embeddings : Extensions.bool)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:971
   with Import => True, 
        Convention => C, 
        External_Name => "llama_set_embeddings";

   procedure llama_set_causal_attn (ctx : access llama_context; causal_attn : Extensions.bool)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:975
   with Import => True, 
        Convention => C, 
        External_Name => "llama_set_causal_attn";

   procedure llama_set_warmup (ctx : access llama_context; warmup : Extensions.bool)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:982
   with Import => True, 
        Convention => C, 
        External_Name => "llama_set_warmup";

   procedure llama_set_abort_callback
     (ctx : access llama_context;
      abort_callback : ggml_h.ggml_abort_callback;
      abort_callback_data : System.Address)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:986
   with Import => True, 
        Convention => C, 
        External_Name => "llama_set_abort_callback";

   procedure llama_synchronize (ctx : access llama_context)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:991
   with Import => True, 
        Convention => C, 
        External_Name => "llama_synchronize";

   function llama_get_logits (ctx : access llama_context) return access float  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:999
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_logits";

   function llama_get_logits_ith (ctx : access llama_context; i : sys_utypes_uint32_t_h.int32_t) return access float  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1005
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_logits_ith";

   function llama_get_embeddings (ctx : access llama_context) return access float  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1014
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_embeddings";

   function llama_get_embeddings_ith (ctx : access llama_context; i : sys_utypes_uint32_t_h.int32_t) return access float  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1021
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_embeddings_ith";

   function llama_get_embeddings_seq (ctx : access llama_context; seq_id : llama_seq_id) return access float  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1027
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_embeddings_seq";

   function llama_get_sampled_token_ith (ctx : access llama_context; i : sys_utypes_uint32_t_h.int32_t) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1036
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_sampled_token_ith";

   function llama_get_sampled_probs_ith (ctx : access llama_context; i : sys_utypes_uint32_t_h.int32_t) return access float  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1041
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_sampled_probs_ith";

   function llama_get_sampled_probs_count_ith (ctx : access llama_context; i : sys_utypes_uint32_t_h.int32_t) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1042
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_sampled_probs_count_ith";

   function llama_get_sampled_logits_ith (ctx : access llama_context; i : sys_utypes_uint32_t_h.int32_t) return access float  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1046
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_sampled_logits_ith";

   function llama_get_sampled_logits_count_ith (ctx : access llama_context; i : sys_utypes_uint32_t_h.int32_t) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1047
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_sampled_logits_count_ith";

   function llama_get_sampled_candidates_ith (ctx : access llama_context; i : sys_utypes_uint32_t_h.int32_t) return access llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1052
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_sampled_candidates_ith";

   function llama_get_sampled_candidates_count_ith (ctx : access llama_context; i : sys_utypes_uint32_t_h.int32_t) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1053
   with Import => True, 
        Convention => C, 
        External_Name => "llama_get_sampled_candidates_count_ith";

   function llama_vocab_get_text (vocab : access constant llama_vocab; token : llama_token) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1059
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_get_text";

   function llama_vocab_get_score (vocab : access constant llama_vocab; token : llama_token) return float  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1061
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_get_score";

   function llama_vocab_get_attr (vocab : access constant llama_vocab; token : llama_token) return llama_token_attr  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1063
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_get_attr";

   function llama_vocab_is_eog (vocab : access constant llama_vocab; token : llama_token) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1066
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_is_eog";

   function llama_vocab_is_control (vocab : access constant llama_vocab; token : llama_token) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1069
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_is_control";

   function llama_vocab_bos (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1072
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_bos";

   function llama_vocab_eos (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1073
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_eos";

   function llama_vocab_eot (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1074
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_eot";

   function llama_vocab_sep (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1075
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_sep";

   function llama_vocab_nl (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1076
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_nl";

   function llama_vocab_pad (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1077
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_pad";

   function llama_vocab_mask (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1078
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_mask";

   function llama_vocab_get_add_bos (vocab : access constant llama_vocab) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1080
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_get_add_bos";

   function llama_vocab_get_add_eos (vocab : access constant llama_vocab) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1081
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_get_add_eos";

   function llama_vocab_get_add_sep (vocab : access constant llama_vocab) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1082
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_get_add_sep";

   function llama_vocab_fim_pre (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1084
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_fim_pre";

   function llama_vocab_fim_suf (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1085
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_fim_suf";

   function llama_vocab_fim_mid (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1086
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_fim_mid";

   function llama_vocab_fim_pad (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1087
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_fim_pad";

   function llama_vocab_fim_rep (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1088
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_fim_rep";

   function llama_vocab_fim_sep (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1089
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_fim_sep";

   function llama_token_get_text (vocab : access constant llama_vocab; token : llama_token) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1091
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_get_text";

   function llama_token_get_score (vocab : access constant llama_vocab; token : llama_token) return float  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1092
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_get_score";

   function llama_token_get_attr (vocab : access constant llama_vocab; token : llama_token) return llama_token_attr  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1093
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_get_attr";

   function llama_token_is_eog (vocab : access constant llama_vocab; token : llama_token) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1094
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_is_eog";

   function llama_token_is_control (vocab : access constant llama_vocab; token : llama_token) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1095
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_is_control";

   function llama_token_bos (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1096
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_bos";

   function llama_token_eos (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1097
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_eos";

   function llama_token_eot (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1098
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_eot";

   function llama_token_cls (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1099
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_cls";

   function llama_token_sep (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1100
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_sep";

   function llama_token_nl (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1101
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_nl";

   function llama_token_pad (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1102
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_pad";

   function llama_add_bos_token (vocab : access constant llama_vocab) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1103
   with Import => True, 
        Convention => C, 
        External_Name => "llama_add_bos_token";

   function llama_add_eos_token (vocab : access constant llama_vocab) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1104
   with Import => True, 
        Convention => C, 
        External_Name => "llama_add_eos_token";

   function llama_token_fim_pre (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1105
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_fim_pre";

   function llama_token_fim_suf (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1106
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_fim_suf";

   function llama_token_fim_mid (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1107
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_fim_mid";

   function llama_token_fim_pad (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1108
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_fim_pad";

   function llama_token_fim_rep (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1109
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_fim_rep";

   function llama_token_fim_sep (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1110
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_fim_sep";

   function llama_vocab_cls (vocab : access constant llama_vocab) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1113
   with Import => True, 
        Convention => C, 
        External_Name => "llama_vocab_cls";

   function llama_tokenize
     (vocab : access constant llama_vocab;
      text : Interfaces.C.Strings.chars_ptr;
      text_len : sys_utypes_uint32_t_h.int32_t;
      tokens : access llama_token;
      n_tokens_max : sys_utypes_uint32_t_h.int32_t;
      add_special : Extensions.bool;
      parse_special : Extensions.bool) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1130
   with Import => True, 
        Convention => C, 
        External_Name => "llama_tokenize";

   function llama_token_to_piece
     (vocab : access constant llama_vocab;
      token : llama_token;
      buf : Interfaces.C.Strings.chars_ptr;
      length : sys_utypes_uint32_t_h.int32_t;
      lstrip : sys_utypes_uint32_t_h.int32_t;
      special : Extensions.bool) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1144
   with Import => True, 
        Convention => C, 
        External_Name => "llama_token_to_piece";

   function llama_detokenize
     (vocab : access constant llama_vocab;
      tokens : access llama_token;
      n_tokens : sys_utypes_uint32_t_h.int32_t;
      text : Interfaces.C.Strings.chars_ptr;
      text_len_max : sys_utypes_uint32_t_h.int32_t;
      remove_special : Extensions.bool;
      unparse_special : Extensions.bool) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1158
   with Import => True, 
        Convention => C, 
        External_Name => "llama_detokenize";

   function llama_chat_apply_template
     (tmpl : Interfaces.C.Strings.chars_ptr;
      chat : access constant llama_chat_message;
      n_msg : stddef_h.size_t;
      add_ass : Extensions.bool;
      buf : Interfaces.C.Strings.chars_ptr;
      length : sys_utypes_uint32_t_h.int32_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1181
   with Import => True, 
        Convention => C, 
        External_Name => "llama_chat_apply_template";

   function llama_chat_builtin_templates (output : System.Address; len : stddef_h.size_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1190
   with Import => True, 
        Convention => C, 
        External_Name => "llama_chat_builtin_templates";

   type llama_sampler_context_t is new System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1227

   type llama_sampler_data is record
      logits : access ggml_h.ggml_tensor;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1230
      probs : access ggml_h.ggml_tensor;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1231
      sampled : access ggml_h.ggml_tensor;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1232
      candidates : access ggml_h.ggml_tensor;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1233
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1229

   type llama_sampler_i is record
      name : access function (arg1 : access constant llama_sampler) return Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1238
      c_accept : access procedure (arg1 : access llama_sampler; arg2 : llama_token);  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1239
      apply : access procedure (arg1 : access llama_sampler; arg2 : access llama_token_data_array);  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1240
      reset : access procedure (arg1 : access llama_sampler);  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1241
      clone : access function (arg1 : access constant llama_sampler) return access llama_sampler;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1242
      free : access procedure (arg1 : access llama_sampler);  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1243
      backend_init : access function (arg1 : access llama_sampler; arg2 : ggml_backend_h.ggml_backend_buffer_type_t) return Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1250
      backend_accept : access procedure
           (arg1 : access llama_sampler;
            arg2 : access ggml_h.ggml_context;
            arg3 : access ggml_h.ggml_cgraph;
            arg4 : access ggml_h.ggml_tensor);  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1253
      backend_apply : access procedure
           (arg1 : access llama_sampler;
            arg2 : access ggml_h.ggml_context;
            arg3 : access ggml_h.ggml_cgraph;
            arg4 : access llama_sampler_data);  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1260
      backend_set_input : access procedure (arg1 : access llama_sampler);  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1267
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1237

   type llama_sampler is record
      iface : access llama_sampler_i;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1271
      ctx : llama_sampler_context_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1273
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1270

   function llama_set_sampler
     (ctx : access llama_context;
      seq_id : llama_seq_id;
      smpl : access llama_sampler) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1279
   with Import => True, 
        Convention => C, 
        External_Name => "llama_set_sampler";

   function llama_sampler_init (iface : access llama_sampler_i; ctx : llama_sampler_context_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1282
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init";

   function llama_sampler_name (smpl : access constant llama_sampler) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1283
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_name";

   procedure llama_sampler_accept (smpl : access llama_sampler; token : llama_token)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1284
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_accept";

   procedure llama_sampler_apply (smpl : access llama_sampler; cur_p : access llama_token_data_array)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1285
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_apply";

   procedure llama_sampler_reset (smpl : access llama_sampler)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1286
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_reset";

   function llama_sampler_clone (smpl : access constant llama_sampler) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1287
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_clone";

   procedure llama_sampler_free (smpl : access llama_sampler)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1289
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_free";

   function llama_sampler_chain_init (params : llama_sampler_chain_params) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1294
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_chain_init";

   procedure llama_sampler_chain_add (chain : access llama_sampler; smpl : access llama_sampler)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1297
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_chain_add";

   function llama_sampler_chain_get (chain : access llama_sampler; i : sys_utypes_uint32_t_h.int32_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1304
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_chain_get";

   function llama_sampler_chain_n (chain : access constant llama_sampler) return int  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1307
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_chain_n";

   function llama_sampler_chain_remove (chain : access llama_sampler; i : sys_utypes_uint32_t_h.int32_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1310
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_chain_remove";

   function llama_sampler_init_greedy return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1314
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_greedy";

   function llama_sampler_init_dist (seed : utypes_uuint32_t_h.uint32_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1317
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_dist";

   function llama_sampler_init_top_k (k : sys_utypes_uint32_t_h.int32_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1321
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_top_k";

   function llama_sampler_init_top_p (p : float; min_keep : stddef_h.size_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1324
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_top_p";

   function llama_sampler_init_min_p (p : float; min_keep : stddef_h.size_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1327
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_min_p";

   function llama_sampler_init_typical (p : float; min_keep : stddef_h.size_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1330
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_typical";

   function llama_sampler_init_temp (t : float) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1333
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_temp";

   function llama_sampler_init_temp_ext
     (t : float;
      c_delta : float;
      exponent : float) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1336
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_temp_ext";

   function llama_sampler_init_xtc
     (p : float;
      t : float;
      min_keep : stddef_h.size_t;
      seed : utypes_uuint32_t_h.uint32_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1339
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_xtc";

   function llama_sampler_init_top_n_sigma (n : float) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1342
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_top_n_sigma";

   function llama_sampler_init_mirostat
     (n_vocab : sys_utypes_uint32_t_h.int32_t;
      seed : utypes_uuint32_t_h.uint32_t;
      tau : float;
      eta : float;
      m : sys_utypes_uint32_t_h.int32_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1350
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_mirostat";

   function llama_sampler_init_mirostat_v2
     (seed : utypes_uuint32_t_h.uint32_t;
      tau : float;
      eta : float) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1362
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_mirostat_v2";

   function llama_sampler_init_grammar
     (vocab : access constant llama_vocab;
      grammar_str : Interfaces.C.Strings.chars_ptr;
      grammar_root : Interfaces.C.Strings.chars_ptr) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1371
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_grammar";

   function llama_sampler_init_grammar_lazy
     (vocab : access constant llama_vocab;
      grammar_str : Interfaces.C.Strings.chars_ptr;
      grammar_root : Interfaces.C.Strings.chars_ptr;
      trigger_words : System.Address;
      num_trigger_words : stddef_h.size_t;
      trigger_tokens : access llama_token;
      num_trigger_tokens : stddef_h.size_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1376
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_grammar_lazy";

   function llama_sampler_init_grammar_lazy_patterns
     (vocab : access constant llama_vocab;
      grammar_str : Interfaces.C.Strings.chars_ptr;
      grammar_root : Interfaces.C.Strings.chars_ptr;
      trigger_patterns : System.Address;
      num_trigger_patterns : stddef_h.size_t;
      trigger_tokens : access llama_token;
      num_trigger_tokens : stddef_h.size_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1390
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_grammar_lazy_patterns";

   function llama_sampler_init_penalties
     (penalty_last_n : sys_utypes_uint32_t_h.int32_t;
      penalty_repeat : float;
      penalty_freq : float;
      penalty_present : float) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1401
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_penalties";

   function llama_sampler_init_dry
     (vocab : access constant llama_vocab;
      n_ctx_train : sys_utypes_uint32_t_h.int32_t;
      dry_multiplier : float;
      dry_base : float;
      dry_allowed_length : sys_utypes_uint32_t_h.int32_t;
      dry_penalty_last_n : sys_utypes_uint32_t_h.int32_t;
      seq_breakers : System.Address;
      num_breakers : stddef_h.size_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1408
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_dry";

   function llama_sampler_init_adaptive_p
     (target : float;
      decay : float;
      seed : utypes_uuint32_t_h.uint32_t) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1440
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_adaptive_p";

   function llama_sampler_init_logit_bias
     (n_vocab : sys_utypes_uint32_t_h.int32_t;
      n_logit_bias : sys_utypes_uint32_t_h.int32_t;
      logit_bias : access constant llama_logit_bias) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1445
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_logit_bias";

   function llama_sampler_init_infill (vocab : access constant llama_vocab) return access llama_sampler  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1471
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_init_infill";

   function llama_sampler_get_seed (smpl : access constant llama_sampler) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1474
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_get_seed";

   function llama_sampler_sample
     (smpl : access llama_sampler;
      ctx : access llama_context;
      idx : sys_utypes_uint32_t_h.int32_t) return llama_token  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1486
   with Import => True, 
        Convention => C, 
        External_Name => "llama_sampler_sample";

   function llama_split_path
     (split_path : Interfaces.C.Strings.chars_ptr;
      maxlen : stddef_h.size_t;
      path_prefix : Interfaces.C.Strings.chars_ptr;
      split_no : sys_utypes_uint32_t_h.int32_t;
      split_count : sys_utypes_uint32_t_h.int32_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1498
   with Import => True, 
        Convention => C, 
        External_Name => "llama_split_path";

   function llama_split_prefix
     (split_prefix : Interfaces.C.Strings.chars_ptr;
      maxlen : stddef_h.size_t;
      split_path : Interfaces.C.Strings.chars_ptr;
      split_no : sys_utypes_uint32_t_h.int32_t;
      split_count : sys_utypes_uint32_t_h.int32_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1503
   with Import => True, 
        Convention => C, 
        External_Name => "llama_split_prefix";

   function llama_print_system_info return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1506
   with Import => True, 
        Convention => C, 
        External_Name => "llama_print_system_info";

   procedure llama_log_get (log_callback : System.Address; user_data : System.Address)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1511
   with Import => True, 
        Convention => C, 
        External_Name => "llama_log_get";

   procedure llama_log_set (log_callback : ggml_h.ggml_log_callback; user_data : System.Address)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1512
   with Import => True, 
        Convention => C, 
        External_Name => "llama_log_set";

   type llama_perf_context_data is record
      t_start_ms : aliased double;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1522
      t_load_ms : aliased double;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1523
      t_p_eval_ms : aliased double;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1524
      t_eval_ms : aliased double;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1525
      n_p_eval : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1527
      n_eval : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1528
      n_reused : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1529
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1520

   type llama_perf_sampler_data is record
      t_sample_ms : aliased double;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1533
      n_sample : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1535
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1532

   function llama_perf_context (ctx : access constant llama_context) return llama_perf_context_data  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1538
   with Import => True, 
        Convention => C, 
        External_Name => "llama_perf_context";

   procedure llama_perf_context_print (ctx : access constant llama_context)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1539
   with Import => True, 
        Convention => C, 
        External_Name => "llama_perf_context_print";

   procedure llama_perf_context_reset (ctx : access llama_context)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1540
   with Import => True, 
        Convention => C, 
        External_Name => "llama_perf_context_reset";

   function llama_perf_sampler (chain : access constant llama_sampler) return llama_perf_sampler_data  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1543
   with Import => True, 
        Convention => C, 
        External_Name => "llama_perf_sampler";

   procedure llama_perf_sampler_print (chain : access constant llama_sampler)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1544
   with Import => True, 
        Convention => C, 
        External_Name => "llama_perf_sampler_print";

   procedure llama_perf_sampler_reset (chain : access llama_sampler)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1545
   with Import => True, 
        Convention => C, 
        External_Name => "llama_perf_sampler_reset";

   type llama_opt_param_filter is access function (arg1 : access constant ggml_h.ggml_tensor; arg2 : System.Address) return Extensions.bool
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1552

   function llama_opt_param_filter_all (tensor : access constant ggml_h.ggml_tensor; userdata : System.Address) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1555
   with Import => True, 
        Convention => C, 
        External_Name => "llama_opt_param_filter_all";

   type llama_opt_params is record
      n_ctx_train : aliased utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1558
      param_filter : llama_opt_param_filter;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1560
      param_filter_ud : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1561
      get_opt_pars : ggml_opt_h.ggml_opt_get_optimizer_params;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1563
      get_opt_pars_ud : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1564
      optimizer_type : aliased ggml_opt_h.ggml_opt_optimizer_type;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1566
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1557

   procedure llama_opt_init
     (lctx : access llama_context;
      model : access llama_model;
      lopt_params : llama_opt_params)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1569
   with Import => True, 
        Convention => C, 
        External_Name => "llama_opt_init";

   procedure llama_opt_epoch
     (lctx : access llama_context;
      dataset : ggml_opt_h.ggml_opt_dataset_t;
      result_train : ggml_opt_h.ggml_opt_result_t;
      result_eval : ggml_opt_h.ggml_opt_result_t;
      idata_split : sys_utypes_uint64_t_h.int64_t;
      callback_train : ggml_opt_h.ggml_opt_epoch_callback;
      callback_eval : ggml_opt_h.ggml_opt_epoch_callback)  -- /Users/tony/dev/_llama-work/llama.cpp/include/llama.h:1571
   with Import => True, 
        Convention => C, 
        External_Name => "llama_opt_epoch";

end llama_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
