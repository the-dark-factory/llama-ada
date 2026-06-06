pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with ggml_h;
with sys_utypes_uint64_t_h;
with System;
with stddef_h;
with ggml_backend_h;
with sys_utypes_uint32_t_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;

package ggml_opt_h is

   type ggml_opt_dataset is null record;   -- incomplete struct

   type ggml_opt_context is null record;   -- incomplete struct

   type ggml_opt_result is null record;   -- incomplete struct

   type ggml_opt_dataset_t is access all ggml_opt_dataset;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:22

   type ggml_opt_context_t is access all ggml_opt_context;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:23

   type ggml_opt_result_t is access all ggml_opt_result;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:24

   type ggml_opt_loss_type is 
     (GGML_OPT_LOSS_TYPE_MEAN,
      GGML_OPT_LOSS_TYPE_SUM,
      GGML_OPT_LOSS_TYPE_CROSS_ENTROPY,
      GGML_OPT_LOSS_TYPE_MEAN_SQUARED_ERROR)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:30

   function ggml_opt_dataset_init
     (type_data : ggml_h.ggml_type;
      type_label : ggml_h.ggml_type;
      ne_datapoint : sys_utypes_uint64_t_h.int64_t;
      ne_label : sys_utypes_uint64_t_h.int64_t;
      ndata : sys_utypes_uint64_t_h.int64_t;
      ndata_shard : sys_utypes_uint64_t_h.int64_t) return ggml_opt_dataset_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:39
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_dataset_init";

   procedure ggml_opt_dataset_free (dataset : ggml_opt_dataset_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_dataset_free";

   function ggml_opt_dataset_ndata (dataset : ggml_opt_dataset_t) return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:49
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_dataset_ndata";

   function ggml_opt_dataset_data (dataset : ggml_opt_dataset_t) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:50
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_dataset_data";

   function ggml_opt_dataset_labels (dataset : ggml_opt_dataset_t) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:51
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_dataset_labels";

   procedure ggml_opt_dataset_shuffle
     (opt_ctx : ggml_opt_context_t;
      dataset : ggml_opt_dataset_t;
      idata : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_dataset_shuffle";

   procedure ggml_opt_dataset_get_batch
     (dataset : ggml_opt_dataset_t;
      data_batch : access ggml_h.ggml_tensor;
      labels_batch : access ggml_h.ggml_tensor;
      ibatch : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_dataset_get_batch";

   procedure ggml_opt_dataset_get_batch_host
     (dataset : ggml_opt_dataset_t;
      data_batch : System.Address;
      nb_data_batch : stddef_h.size_t;
      labels_batch : System.Address;
      ibatch : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_dataset_get_batch_host";

   subtype ggml_opt_build_type is unsigned;
   ggml_opt_build_type_GGML_OPT_BUILD_TYPE_FORWARD : constant ggml_opt_build_type := 10;
   ggml_opt_build_type_GGML_OPT_BUILD_TYPE_GRAD : constant ggml_opt_build_type := 20;
   ggml_opt_build_type_GGML_OPT_BUILD_TYPE_OPT : constant ggml_opt_build_type := 30;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:71

   type ggml_opt_optimizer_type is 
     (GGML_OPT_OPTIMIZER_TYPE_ADAMW,
      GGML_OPT_OPTIMIZER_TYPE_SGD,
      GGML_OPT_OPTIMIZER_TYPE_COUNT)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:77

   type anon_anon_3 is record
      alpha : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:87
      beta1 : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:88
      beta2 : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:89
      eps : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:90
      wd : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:91
   end record
   with Convention => C_Pass_By_Copy;
   type anon_anon_4 is record
      alpha : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:94
      wd : aliased float;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:95
   end record
   with Convention => C_Pass_By_Copy;
   type ggml_opt_optimizer_params is record
      adamw : aliased anon_anon_3;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:92
      sgd : aliased anon_anon_4;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:96
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:85

   type ggml_opt_get_optimizer_params is access function (arg1 : System.Address) return ggml_opt_optimizer_params
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:101

   function ggml_opt_get_default_optimizer_params (userdata : System.Address) return ggml_opt_optimizer_params  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_get_default_optimizer_params";

   function ggml_opt_get_constant_optimizer_params (userdata : System.Address) return ggml_opt_optimizer_params  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_get_constant_optimizer_params";

   type ggml_opt_params is record
      backend_sched : ggml_backend_h.ggml_backend_sched_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:112
      ctx_compute : access ggml_h.ggml_context;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:116
      inputs : access ggml_h.ggml_tensor;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:117
      outputs : access ggml_h.ggml_tensor;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:118
      loss_type : aliased ggml_opt_loss_type;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:120
      build_type : aliased ggml_opt_build_type;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:121
      opt_period : aliased sys_utypes_uint32_t_h.int32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:123
      get_opt_pars : ggml_opt_get_optimizer_params;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:125
      get_opt_pars_ud : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:126
      optimizer : aliased ggml_opt_optimizer_type;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:129
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:111

   function ggml_opt_default_params (backend_sched : ggml_backend_h.ggml_backend_sched_t; loss_type : ggml_opt_loss_type) return ggml_opt_params  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:134
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_default_params";

   function ggml_opt_init (params : ggml_opt_params) return ggml_opt_context_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_init";

   procedure ggml_opt_free (opt_ctx : ggml_opt_context_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:139
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_free";

   procedure ggml_opt_reset (opt_ctx : ggml_opt_context_t; optimizer : Extensions.bool)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_reset";

   function ggml_opt_static_graphs (opt_ctx : ggml_opt_context_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_static_graphs";

   function ggml_opt_inputs (opt_ctx : ggml_opt_context_t) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:148
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_inputs";

   function ggml_opt_outputs (opt_ctx : ggml_opt_context_t) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_outputs";

   function ggml_opt_labels (opt_ctx : ggml_opt_context_t) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_labels";

   function ggml_opt_loss (opt_ctx : ggml_opt_context_t) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_loss";

   function ggml_opt_pred (opt_ctx : ggml_opt_context_t) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_pred";

   function ggml_opt_ncorrect (opt_ctx : ggml_opt_context_t) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_ncorrect";

   function ggml_opt_grad_acc (opt_ctx : ggml_opt_context_t; node : access ggml_h.ggml_tensor) return access ggml_h.ggml_tensor  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_grad_acc";

   function ggml_opt_context_optimizer_type (arg1 : ggml_opt_context_t) return ggml_opt_optimizer_type  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:158
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_context_optimizer_type";

   function ggml_opt_optimizer_name (arg1 : ggml_opt_optimizer_type) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:160
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_optimizer_name";

   function ggml_opt_result_init return ggml_opt_result_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_result_init";

   procedure ggml_opt_result_free (result : ggml_opt_result_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:165
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_result_free";

   procedure ggml_opt_result_reset (result : ggml_opt_result_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_result_reset";

   procedure ggml_opt_result_ndata (result : ggml_opt_result_t; ndata : access sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:169
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_result_ndata";

   procedure ggml_opt_result_loss
     (result : ggml_opt_result_t;
      loss : access double;
      unc : access double)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_result_loss";

   procedure ggml_opt_result_pred (result : ggml_opt_result_t; pred : access sys_utypes_uint32_t_h.int32_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_result_pred";

   procedure ggml_opt_result_accuracy
     (result : ggml_opt_result_t;
      accuracy : access double;
      unc : access double)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_result_accuracy";

   procedure ggml_opt_prepare_alloc
     (opt_ctx : ggml_opt_context_t;
      ctx_compute : access ggml_h.ggml_context;
      gf : access ggml_h.ggml_cgraph;
      inputs : access ggml_h.ggml_tensor;
      outputs : access ggml_h.ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:177
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_prepare_alloc";

   procedure ggml_opt_alloc (opt_ctx : ggml_opt_context_t; backward : Extensions.bool)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_alloc";

   procedure ggml_opt_eval (opt_ctx : ggml_opt_context_t; result : ggml_opt_result_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:189
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_eval";

   type ggml_opt_epoch_callback is access procedure
        (arg1 : Extensions.bool;
         arg2 : ggml_opt_context_t;
         arg3 : ggml_opt_dataset_t;
         arg4 : ggml_opt_result_t;
         arg5 : sys_utypes_uint64_t_h.int64_t;
         arg6 : sys_utypes_uint64_t_h.int64_t;
         arg7 : sys_utypes_uint64_t_h.int64_t)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:209

   procedure ggml_opt_epoch
     (opt_ctx : ggml_opt_context_t;
      dataset : ggml_opt_dataset_t;
      result_train : ggml_opt_result_t;
      result_eval : ggml_opt_result_t;
      idata_split : sys_utypes_uint64_t_h.int64_t;
      callback_train : ggml_opt_epoch_callback;
      callback_eval : ggml_opt_epoch_callback)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:219
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_epoch";

   procedure ggml_opt_epoch_callback_progress_bar
     (train : Extensions.bool;
      opt_ctx : ggml_opt_context_t;
      dataset : ggml_opt_dataset_t;
      result : ggml_opt_result_t;
      ibatch : sys_utypes_uint64_t_h.int64_t;
      ibatch_max : sys_utypes_uint64_t_h.int64_t;
      t_start_us : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:229
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_epoch_callback_progress_bar";

   procedure ggml_opt_fit
     (backend_sched : ggml_backend_h.ggml_backend_sched_t;
      ctx_compute : access ggml_h.ggml_context;
      inputs : access ggml_h.ggml_tensor;
      outputs : access ggml_h.ggml_tensor;
      dataset : ggml_opt_dataset_t;
      loss_type : ggml_opt_loss_type;
      optimizer : ggml_opt_optimizer_type;
      get_opt_pars : ggml_opt_get_optimizer_params;
      nepoch : sys_utypes_uint64_t_h.int64_t;
      nbatch_logical : sys_utypes_uint64_t_h.int64_t;
      val_split : float;
      silent : Extensions.bool)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-opt.h:239
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_opt_fit";

end ggml_opt_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
