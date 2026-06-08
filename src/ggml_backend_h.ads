pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
limited with ggml_alloc_h;
with ggml_h;
with System;
with Interfaces.C.Strings;
with stddef_h;
with Interfaces.C.Extensions;
with utypes_uuint8_t_h;
with sys_utypes_uint64_t_h;
with utypes_uuint32_t_h;

package ggml_backend_h is

   --  unsupported macro: GGML_BACKEND_API extern
   GGML_BACKEND_META_MAX_DEVICES : constant := 16;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:358

   type ggml_backend_buffer_type_t is access all ggml_alloc_h.ggml_backend_buffer_type;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:24

   type ggml_backend_buffer_t is access all ggml_h.ggml_backend_buffer;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:25

   type ggml_backend_event is null record;   -- incomplete struct

   type ggml_backend_event_t is access all ggml_backend_event;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:26

   type ggml_backend_t is access all ggml_alloc_h.ggml_backend;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:27

   type ggml_backend_graph_plan_t is new System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:28

   type ggml_backend_reg is null record;   -- incomplete struct

   type ggml_backend_reg_t is access all ggml_backend_reg;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:29

   type ggml_backend_device is null record;   -- incomplete struct

   type ggml_backend_dev_t is access all ggml_backend_device;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:30

   function ggml_backend_buft_name (buft : ggml_backend_buffer_type_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:37
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buft_name";

   function ggml_backend_buft_alloc_buffer (buft : ggml_backend_buffer_type_t; size : stddef_h.size_t) return ggml_backend_buffer_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:38
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buft_alloc_buffer";

   function ggml_backend_buft_get_alignment (buft : ggml_backend_buffer_type_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:39
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buft_get_alignment";

   function ggml_backend_buft_get_max_size (buft : ggml_backend_buffer_type_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:40
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buft_get_max_size";

   function ggml_backend_buft_get_alloc_size (buft : ggml_backend_buffer_type_t; tensor : access constant ggml_h.ggml_tensor) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:41
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buft_get_alloc_size";

   function ggml_backend_buft_is_host (buft : ggml_backend_buffer_type_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:42
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buft_is_host";

   function ggml_backend_buft_get_device (buft : ggml_backend_buffer_type_t) return ggml_backend_dev_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:43
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buft_get_device";

   type ggml_backend_buffer_usage is 
     (GGML_BACKEND_BUFFER_USAGE_ANY,
      GGML_BACKEND_BUFFER_USAGE_WEIGHTS,
      GGML_BACKEND_BUFFER_USAGE_COMPUTE)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:49

   function ggml_backend_buffer_name (buffer : ggml_backend_buffer_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_name";

   procedure ggml_backend_buffer_free (buffer : ggml_backend_buffer_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_free";

   function ggml_backend_buffer_get_base (buffer : ggml_backend_buffer_t) return System.Address  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:57
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_get_base";

   function ggml_backend_buffer_get_size (buffer : ggml_backend_buffer_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:58
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_get_size";

   function ggml_backend_buffer_init_tensor (buffer : ggml_backend_buffer_t; tensor : access ggml_h.ggml_tensor) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:59
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_init_tensor";

   function ggml_backend_buffer_get_alignment (buffer : ggml_backend_buffer_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_get_alignment";

   function ggml_backend_buffer_get_max_size (buffer : ggml_backend_buffer_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_get_max_size";

   function ggml_backend_buffer_get_alloc_size (buffer : ggml_backend_buffer_t; tensor : access constant ggml_h.ggml_tensor) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_get_alloc_size";

   procedure ggml_backend_buffer_clear (buffer : ggml_backend_buffer_t; value : utypes_uuint8_t_h.uint8_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:63
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_clear";

   function ggml_backend_buffer_is_host (buffer : ggml_backend_buffer_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_is_host";

   procedure ggml_backend_buffer_set_usage (buffer : ggml_backend_buffer_t; usage : ggml_backend_buffer_usage)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:65
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_set_usage";

   function ggml_backend_buffer_get_usage (buffer : ggml_backend_buffer_t) return ggml_backend_buffer_usage  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:66
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_get_usage";

   function ggml_backend_buffer_get_type (buffer : ggml_backend_buffer_t) return ggml_backend_buffer_type_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_get_type";

   procedure ggml_backend_buffer_reset (buffer : ggml_backend_buffer_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_buffer_reset";

   procedure ggml_backend_tensor_copy (src : access constant ggml_h.ggml_tensor; dst : access ggml_h.ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_copy";

   function ggml_backend_guid (backend : ggml_backend_t) return ggml_h.ggml_guid_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:77
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_guid";

   function ggml_backend_name (backend : ggml_backend_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_name";

   procedure ggml_backend_free (backend : ggml_backend_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_free";

   function ggml_backend_get_default_buffer_type (backend : ggml_backend_t) return ggml_backend_buffer_type_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_get_default_buffer_type";

   function ggml_backend_alloc_buffer (backend : ggml_backend_t; size : stddef_h.size_t) return ggml_backend_buffer_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_alloc_buffer";

   function ggml_backend_get_alignment (backend : ggml_backend_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_get_alignment";

   function ggml_backend_get_max_size (backend : ggml_backend_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_get_max_size";

   procedure ggml_backend_tensor_set_async
     (backend : ggml_backend_t;
      tensor : access ggml_h.ggml_tensor;
      data : System.Address;
      offset : stddef_h.size_t;
      size : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:86
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_set_async";

   procedure ggml_backend_tensor_get_async
     (backend : ggml_backend_t;
      tensor : access constant ggml_h.ggml_tensor;
      data : System.Address;
      offset : stddef_h.size_t;
      size : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_get_async";

   procedure ggml_backend_tensor_set_2d_async
     (backend : ggml_backend_t;
      tensor : access ggml_h.ggml_tensor;
      data : System.Address;
      offset : stddef_h.size_t;
      size : stddef_h.size_t;
      n_copies : stddef_h.size_t;
      stride_tensor : stddef_h.size_t;
      stride_data : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_set_2d_async";

   procedure ggml_backend_tensor_get_2d_async
     (backend : ggml_backend_t;
      tensor : access constant ggml_h.ggml_tensor;
      data : System.Address;
      offset : stddef_h.size_t;
      size : stddef_h.size_t;
      n_copies : stddef_h.size_t;
      stride_tensor : stddef_h.size_t;
      stride_data : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_get_2d_async";

   procedure ggml_backend_tensor_set
     (tensor : access ggml_h.ggml_tensor;
      data : System.Address;
      offset : stddef_h.size_t;
      size : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_set";

   procedure ggml_backend_tensor_get
     (tensor : access constant ggml_h.ggml_tensor;
      data : System.Address;
      offset : stddef_h.size_t;
      size : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:93
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_get";

   procedure ggml_backend_tensor_set_2d
     (tensor : access ggml_h.ggml_tensor;
      data : System.Address;
      offset : stddef_h.size_t;
      size : stddef_h.size_t;
      n_copies : stddef_h.size_t;
      stride_tensor : stddef_h.size_t;
      stride_data : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:94
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_set_2d";

   procedure ggml_backend_tensor_get_2d
     (tensor : access constant ggml_h.ggml_tensor;
      data : System.Address;
      offset : stddef_h.size_t;
      size : stddef_h.size_t;
      n_copies : stddef_h.size_t;
      stride_tensor : stddef_h.size_t;
      stride_data : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_get_2d";

   procedure ggml_backend_tensor_memset
     (tensor : access ggml_h.ggml_tensor;
      value : utypes_uuint8_t_h.uint8_t;
      offset : stddef_h.size_t;
      size : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:96
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_memset";

   procedure ggml_backend_synchronize (backend : ggml_backend_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_synchronize";

   function ggml_backend_graph_plan_create (backend : ggml_backend_t; cgraph : access ggml_h.ggml_cgraph) return ggml_backend_graph_plan_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_graph_plan_create";

   procedure ggml_backend_graph_plan_free (backend : ggml_backend_t; plan : ggml_backend_graph_plan_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:101
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_graph_plan_free";

   function ggml_backend_graph_plan_compute (backend : ggml_backend_t; plan : ggml_backend_graph_plan_t) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_graph_plan_compute";

   function ggml_backend_graph_compute (backend : ggml_backend_t; cgraph : access ggml_h.ggml_cgraph) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:104
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_graph_compute";

   function ggml_backend_graph_compute_async (backend : ggml_backend_t; cgraph : access ggml_h.ggml_cgraph) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_graph_compute_async";

   function ggml_backend_supports_op (backend : ggml_backend_t; op : access constant ggml_h.ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_supports_op";

   function ggml_backend_supports_buft (backend : ggml_backend_t; buft : ggml_backend_buffer_type_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_supports_buft";

   function ggml_backend_offload_op (backend : ggml_backend_t; op : access constant ggml_h.ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_offload_op";

   procedure ggml_backend_tensor_copy_async
     (backend_src : ggml_backend_t;
      backend_dst : ggml_backend_t;
      src : access constant ggml_h.ggml_tensor;
      dst : access ggml_h.ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:116
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_copy_async";

   function ggml_backend_get_device (backend : ggml_backend_t) return ggml_backend_dev_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:118
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_get_device";

   function ggml_backend_event_new (device : ggml_backend_dev_t) return ggml_backend_event_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:124
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_event_new";

   procedure ggml_backend_event_free (event : ggml_backend_event_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_event_free";

   procedure ggml_backend_event_record (event : ggml_backend_event_t; backend : ggml_backend_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_event_record";

   procedure ggml_backend_event_synchronize (event : ggml_backend_event_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:127
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_event_synchronize";

   procedure ggml_backend_event_wait (backend : ggml_backend_t; event : ggml_backend_event_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_event_wait";

   type ggml_backend_dev_type is 
     (GGML_BACKEND_DEVICE_TYPE_CPU,
      GGML_BACKEND_DEVICE_TYPE_GPU,
      GGML_BACKEND_DEVICE_TYPE_IGPU,
      GGML_BACKEND_DEVICE_TYPE_ACCEL,
      GGML_BACKEND_DEVICE_TYPE_META)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:134

   type ggml_backend_dev_caps is record
      async : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:150
      host_buffer : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:152
      buffer_from_host_ptr : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:154
      events : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:156
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:148

   type ggml_backend_dev_props is record
      name : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:162
      description : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:164
      memory_free : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:166
      memory_total : aliased stddef_h.size_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:168
      c_type : aliased ggml_backend_dev_type;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:170
      device_id : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:174
      caps : aliased ggml_backend_dev_caps;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:176
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:160

   function ggml_backend_dev_name (device : ggml_backend_dev_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:179
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_name";

   function ggml_backend_dev_description (device : ggml_backend_dev_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:180
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_description";

   procedure ggml_backend_dev_memory
     (device : ggml_backend_dev_t;
      free : access stddef_h.size_t;
      total : access stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:181
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_memory";

   function ggml_backend_dev_get_type (device : ggml_backend_dev_t) return ggml_backend_dev_type  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_type";

   procedure ggml_backend_dev_get_props (device : ggml_backend_dev_t; props : access ggml_backend_dev_props)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:183
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_get_props";

   function ggml_backend_dev_backend_reg (device : ggml_backend_dev_t) return ggml_backend_reg_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:184
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_backend_reg";

   function ggml_backend_dev_init (device : ggml_backend_dev_t; params : Interfaces.C.Strings.chars_ptr) return ggml_backend_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:185
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_init";

   function ggml_backend_dev_buffer_type (device : ggml_backend_dev_t) return ggml_backend_buffer_type_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_buffer_type";

   function ggml_backend_dev_host_buffer_type (device : ggml_backend_dev_t) return ggml_backend_buffer_type_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:187
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_host_buffer_type";

   function ggml_backend_dev_buffer_from_host_ptr
     (device : ggml_backend_dev_t;
      ptr : System.Address;
      size : stddef_h.size_t;
      max_tensor_size : stddef_h.size_t) return ggml_backend_buffer_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:188
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_buffer_from_host_ptr";

   function ggml_backend_dev_supports_op (device : ggml_backend_dev_t; op : access constant ggml_h.ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:190
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_supports_op";

   function ggml_backend_dev_supports_buft (device : ggml_backend_dev_t; buft : ggml_backend_buffer_type_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:191
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_supports_buft";

   function ggml_backend_dev_offload_op (device : ggml_backend_dev_t; op : access constant ggml_h.ggml_tensor) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:192
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_offload_op";

   function ggml_backend_reg_name (reg : ggml_backend_reg_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:198
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_reg_name";

   function ggml_backend_reg_dev_count (reg : ggml_backend_reg_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:199
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_reg_dev_count";

   function ggml_backend_reg_dev_get (reg : ggml_backend_reg_t; index : stddef_h.size_t) return ggml_backend_dev_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:200
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_reg_dev_get";

   function ggml_backend_reg_get_proc_address (reg : ggml_backend_reg_t; name : Interfaces.C.Strings.chars_ptr) return System.Address  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:201
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_reg_get_proc_address";

   type ggml_backend_comm_init_t is access function (arg1 : System.Address; arg2 : stddef_h.size_t) return System.Address
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:206

   type ggml_backend_comm_free_t is access procedure (arg1 : System.Address)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:207

   type ggml_backend_comm_allreduce_tensor_t is access function (arg1 : System.Address; arg2 : System.Address) return Extensions.bool
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:208

   type ggml_backend_split_buffer_type_t is access function (arg1 : int; arg2 : access float) return ggml_backend_buffer_type_t
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:211

   type ggml_backend_set_n_threads_t is access procedure (arg1 : ggml_backend_t; arg2 : int)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:213

   type ggml_backend_dev_get_extra_bufts_t is access function (arg1 : ggml_backend_dev_t) return System.Address
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:215

   type ggml_backend_set_abort_callback_t is access procedure
        (arg1 : ggml_backend_t;
         arg2 : ggml_h.ggml_abort_callback;
         arg3 : System.Address)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:217

   type ggml_backend_feature is record
      name : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:220
      value : Interfaces.C.Strings.chars_ptr;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:221
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:219

   type ggml_backend_get_features_t is access function (arg1 : ggml_backend_reg_t) return access ggml_backend_feature
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:223

   procedure ggml_backend_register (reg : ggml_backend_reg_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:229
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_register";

   procedure ggml_backend_device_register (device : ggml_backend_dev_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:231
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_device_register";

   function ggml_backend_reg_count return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:234
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_reg_count";

   function ggml_backend_reg_get (index : stddef_h.size_t) return ggml_backend_reg_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:235
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_reg_get";

   function ggml_backend_reg_by_name (name : Interfaces.C.Strings.chars_ptr) return ggml_backend_reg_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:236
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_reg_by_name";

   function ggml_backend_dev_count return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:239
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_count";

   function ggml_backend_dev_get (index : stddef_h.size_t) return ggml_backend_dev_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:240
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_get";

   function ggml_backend_dev_by_name (name : Interfaces.C.Strings.chars_ptr) return ggml_backend_dev_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:241
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_by_name";

   function ggml_backend_dev_by_type (c_type : ggml_backend_dev_type) return ggml_backend_dev_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_dev_by_type";

   function ggml_backend_init_by_name (name : Interfaces.C.Strings.chars_ptr; params : Interfaces.C.Strings.chars_ptr) return ggml_backend_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:246
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_init_by_name";

   function ggml_backend_init_by_type (c_type : ggml_backend_dev_type; params : Interfaces.C.Strings.chars_ptr) return ggml_backend_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:248
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_init_by_type";

   function ggml_backend_init_best return ggml_backend_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:250
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_init_best";

   function ggml_backend_load (path : Interfaces.C.Strings.chars_ptr) return ggml_backend_reg_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:253
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_load";

   procedure ggml_backend_unload (reg : ggml_backend_reg_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:255
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_unload";

   procedure ggml_backend_load_all  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:257
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_load_all";

   procedure ggml_backend_load_all_from_path (dir_path : Interfaces.C.Strings.chars_ptr)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:258
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_load_all_from_path";

   type ggml_backend_sched is null record;   -- incomplete struct

   type ggml_backend_sched_t is access all ggml_backend_sched;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:305

   type ggml_backend_sched_eval_callback is access function
        (arg1 : access ggml_h.ggml_tensor;
         arg2 : Extensions.bool;
         arg3 : System.Address) return Extensions.bool
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:314

   function ggml_backend_sched_new
     (backends : System.Address;
      bufts : System.Address;
      n_backends : int;
      graph_size : stddef_h.size_t;
      parallel : Extensions.bool;
      op_offload : Extensions.bool) return ggml_backend_sched_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:317
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_new";

   procedure ggml_backend_sched_free (sched : ggml_backend_sched_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:318
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_free";

   procedure ggml_backend_sched_reserve_size
     (sched : ggml_backend_sched_t;
      measure_graph : access ggml_h.ggml_cgraph;
      sizes : access stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:321
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_reserve_size";

   function ggml_backend_sched_reserve (sched : ggml_backend_sched_t; measure_graph : access ggml_h.ggml_cgraph) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:322
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_reserve";

   function ggml_backend_sched_get_n_backends (sched : ggml_backend_sched_t) return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:324
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_get_n_backends";

   function ggml_backend_sched_get_backend (sched : ggml_backend_sched_t; i : int) return ggml_backend_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:325
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_get_backend";

   function ggml_backend_sched_get_n_splits (sched : ggml_backend_sched_t) return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:328
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_get_n_splits";

   function ggml_backend_sched_get_n_copies (sched : ggml_backend_sched_t) return int  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:329
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_get_n_copies";

   function ggml_backend_sched_get_buffer_type (sched : ggml_backend_sched_t; backend : ggml_backend_t) return ggml_backend_buffer_type_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:331
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_get_buffer_type";

   function ggml_backend_sched_get_buffer_size (sched : ggml_backend_sched_t; backend : ggml_backend_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_get_buffer_size";

   procedure ggml_backend_sched_set_tensor_backend
     (sched : ggml_backend_sched_t;
      node : access ggml_h.ggml_tensor;
      backend : ggml_backend_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:334
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_set_tensor_backend";

   function ggml_backend_sched_get_tensor_backend (sched : ggml_backend_sched_t; node : access ggml_h.ggml_tensor) return ggml_backend_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:335
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_get_tensor_backend";

   procedure ggml_backend_sched_split_graph (sched : ggml_backend_sched_t; graph : access ggml_h.ggml_cgraph)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:338
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_split_graph";

   function ggml_backend_sched_alloc_graph (sched : ggml_backend_sched_t; graph : access ggml_h.ggml_cgraph) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:341
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_alloc_graph";

   function ggml_backend_sched_graph_compute (sched : ggml_backend_sched_t; graph : access ggml_h.ggml_cgraph) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:342
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_graph_compute";

   function ggml_backend_sched_graph_compute_async (sched : ggml_backend_sched_t; graph : access ggml_h.ggml_cgraph) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:343
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_graph_compute_async";

   procedure ggml_backend_sched_synchronize (sched : ggml_backend_sched_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:344
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_synchronize";

   procedure ggml_backend_sched_reset (sched : ggml_backend_sched_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:349
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_reset";

   procedure ggml_backend_sched_set_eval_callback
     (sched : ggml_backend_sched_t;
      callback : ggml_backend_sched_eval_callback;
      user_data : System.Address)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:352
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_sched_set_eval_callback";

   subtype ggml_backend_meta_split_axis is unsigned;
   ggml_backend_meta_split_axis_GGML_BACKEND_SPLIT_AXIS_0 : constant ggml_backend_meta_split_axis := 0;
   ggml_backend_meta_split_axis_GGML_BACKEND_SPLIT_AXIS_1 : constant ggml_backend_meta_split_axis := 1;
   ggml_backend_meta_split_axis_GGML_BACKEND_SPLIT_AXIS_2 : constant ggml_backend_meta_split_axis := 2;
   ggml_backend_meta_split_axis_GGML_BACKEND_SPLIT_AXIS_3 : constant ggml_backend_meta_split_axis := 3;
   ggml_backend_meta_split_axis_GGML_BACKEND_SPLIT_AXIS_MIRRORED : constant ggml_backend_meta_split_axis := 10;
   ggml_backend_meta_split_axis_GGML_BACKEND_SPLIT_AXIS_PARTIAL : constant ggml_backend_meta_split_axis := 11;
   ggml_backend_meta_split_axis_GGML_BACKEND_SPLIT_AXIS_NONE : constant ggml_backend_meta_split_axis := 98;
   ggml_backend_meta_split_axis_GGML_BACKEND_SPLIT_AXIS_UNKNOWN : constant ggml_backend_meta_split_axis := 99;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:360

   function ggml_backend_meta_split_axis_name (split_axis : ggml_backend_meta_split_axis) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:374
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_meta_split_axis_name";

   type anon_array2531 is array (0 .. 255) of aliased sys_utypes_uint64_t_h.int64_t;
   type anon_array2533 is array (0 .. 15) of aliased utypes_uuint32_t_h.uint32_t;
   type ggml_backend_meta_split_state is record
      axis : aliased ggml_backend_meta_split_axis;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:377
      ne : aliased anon_array2531;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:391
      nr : aliased anon_array2533;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:392
      n_segments : aliased utypes_uuint32_t_h.uint32_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:393
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:376

   type ggml_backend_meta_get_split_state_t is access function (arg1 : access constant ggml_h.ggml_tensor; arg2 : System.Address) return ggml_backend_meta_split_state
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:397

   function ggml_backend_meta_device
     (devs : System.Address;
      n_devs : stddef_h.size_t;
      get_split_state : ggml_backend_meta_get_split_state_t;
      get_split_state_ud : System.Address) return ggml_backend_dev_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:402
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_meta_device";

   type ggml_backend_graph_copy is record
      buffer : ggml_backend_buffer_t;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:410
      ctx_allocated : access ggml_h.ggml_context;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:411
      ctx_unallocated : access ggml_h.ggml_context;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:412
      graph : access ggml_h.ggml_cgraph;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:413
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:409

   function ggml_backend_make_graph_copy (backend : ggml_backend_t; graph : access ggml_h.ggml_cgraph) return ggml_backend_graph_copy  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:417
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_graph_copy";

   procedure ggml_backend_graph_copy_free (copy : ggml_backend_graph_copy)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:418
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_graph_copy_free";

   type ggml_backend_eval_callback is access function
        (arg1 : int;
         arg2 : access ggml_h.ggml_tensor;
         arg3 : access ggml_h.ggml_tensor;
         arg4 : System.Address) return Extensions.bool
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:420

   function ggml_backend_compare_graph_backend
     (backend1 : ggml_backend_t;
      backend2 : ggml_backend_t;
      graph : access ggml_h.ggml_cgraph;
      callback : ggml_backend_eval_callback;
      user_data : System.Address;
      test_nodes : System.Address;
      num_test_nodes : stddef_h.size_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:423
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_compare_graph_backend";

   function ggml_backend_tensor_alloc
     (buffer : ggml_backend_buffer_t;
      tensor : access ggml_h.ggml_tensor;
      addr : System.Address) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:426
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_tensor_alloc";

   function ggml_backend_view_init (tensor : access ggml_h.ggml_tensor) return ggml_h.ggml_status  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:427
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_view_init";

   function ggml_backend_cpu_buffer_from_ptr (ptr : System.Address; size : stddef_h.size_t) return ggml_backend_buffer_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:430
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_cpu_buffer_from_ptr";

   function ggml_backend_cpu_buffer_type return ggml_backend_buffer_type_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/ggml-backend.h:431
   with Import => True, 
        Convention => C, 
        External_Name => "ggml_backend_cpu_buffer_type";

end ggml_backend_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
