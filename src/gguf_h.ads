pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with System;
with utypes_uuint64_t_h;
with stddef_h;
with Interfaces.C.Strings;
with utypes_uuint32_t_h;
with sys_utypes_uint64_t_h;
with utypes_uuint8_t_h;
with sys_utypes_uint8_t_h;
with utypes_uuint16_t_h;
with sys_utypes_uint16_t_h;
with sys_utypes_uint32_t_h;
with ggml_h;

package gguf_h is

   GGUF_MAGIC : aliased constant String := "GGUF" & ASCII.NUL;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:41
   GGUF_VERSION : constant := 3;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:42

   GGUF_KEY_GENERAL_ALIGNMENT : aliased constant String := "general.alignment" & ASCII.NUL;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:44

   GGUF_DEFAULT_ALIGNMENT : constant := 32;  --  /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:46

   type gguf_type is 
     (GGUF_TYPE_UINT8,
      GGUF_TYPE_INT8,
      GGUF_TYPE_UINT16,
      GGUF_TYPE_INT16,
      GGUF_TYPE_UINT32,
      GGUF_TYPE_INT32,
      GGUF_TYPE_FLOAT32,
      GGUF_TYPE_BOOL,
      GGUF_TYPE_STRING,
      GGUF_TYPE_ARRAY,
      GGUF_TYPE_UINT64,
      GGUF_TYPE_INT64,
      GGUF_TYPE_FLOAT64,
      GGUF_TYPE_COUNT)
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:53

   type gguf_context is null record;   -- incomplete struct

   type gguf_init_params is record
      no_alloc : aliased Extensions.bool;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:73
      ctx : System.Address;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:76
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:72

   type gguf_reader_callback_t is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : utypes_uuint64_t_h.uint64_t;
         arg4 : stddef_h.size_t) return stddef_h.size_t
   with Convention => C;  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:80

   function gguf_init_empty return access gguf_context  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_init_empty";

   gguf_init_from_file_ptr : access gguf_context  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_init_from_file_ptr";

   function gguf_init_from_file (fname : Interfaces.C.Strings.chars_ptr; params : gguf_init_params) return access gguf_context  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_init_from_file";

   function gguf_init_from_buffer
     (data : System.Address;
      size : stddef_h.size_t;
      params : gguf_init_params) return access gguf_context  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_init_from_buffer";

   function gguf_init_from_callback
     (callback : gguf_reader_callback_t;
      userdata : System.Address;
      max_chunk_read : stddef_h.size_t;
      max_expected_size : utypes_uuint64_t_h.uint64_t;
      params : gguf_init_params) return access gguf_context  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_init_from_callback";

   procedure gguf_free (ctx : access gguf_context)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_free";

   function gguf_type_name (c_type : gguf_type) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_type_name";

   function gguf_get_version (ctx : access constant gguf_context) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:94
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_version";

   function gguf_get_alignment (ctx : access constant gguf_context) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_alignment";

   function gguf_get_data_offset (ctx : access constant gguf_context) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:96
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_data_offset";

   function gguf_get_n_kv (ctx : access constant gguf_context) return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_n_kv";

   function gguf_find_key (ctx : access constant gguf_context; key : Interfaces.C.Strings.chars_ptr) return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:99
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_find_key";

   function gguf_get_key (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_key";

   function gguf_get_kv_type (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return gguf_type  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:102
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_kv_type";

   function gguf_get_arr_type (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return gguf_type  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_arr_type";

   function gguf_get_val_u8 (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return utypes_uuint8_t_h.uint8_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_u8";

   function gguf_get_val_i8 (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return sys_utypes_uint8_t_h.int8_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_i8";

   function gguf_get_val_u16 (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return utypes_uuint16_t_h.uint16_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:108
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_u16";

   function gguf_get_val_i16 (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return sys_utypes_uint16_t_h.int16_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_i16";

   function gguf_get_val_u32 (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return utypes_uuint32_t_h.uint32_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_u32";

   function gguf_get_val_i32 (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return sys_utypes_uint32_t_h.int32_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_i32";

   function gguf_get_val_f32 (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return float  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:112
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_f32";

   function gguf_get_val_u64 (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return utypes_uuint64_t_h.uint64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:113
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_u64";

   function gguf_get_val_i64 (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_i64";

   function gguf_get_val_f64 (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return double  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_f64";

   function gguf_get_val_bool (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:116
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_bool";

   function gguf_get_val_str (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_str";

   function gguf_get_val_data (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return System.Address  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:118
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_val_data";

   function gguf_get_arr_n (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_arr_n";

   function gguf_get_arr_data (ctx : access constant gguf_context; key_id : sys_utypes_uint64_t_h.int64_t) return System.Address  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_arr_data";

   function gguf_get_arr_str
     (ctx : access constant gguf_context;
      key_id : sys_utypes_uint64_t_h.int64_t;
      i : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:126
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_arr_str";

   function gguf_get_n_tensors (ctx : access constant gguf_context) return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_n_tensors";

   function gguf_find_tensor (ctx : access constant gguf_context; name : Interfaces.C.Strings.chars_ptr) return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:129
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_find_tensor";

   function gguf_get_tensor_offset (ctx : access constant gguf_context; tensor_id : sys_utypes_uint64_t_h.int64_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:130
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_tensor_offset";

   function gguf_get_tensor_name (ctx : access constant gguf_context; tensor_id : sys_utypes_uint64_t_h.int64_t) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:131
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_tensor_name";

   function gguf_get_tensor_type (ctx : access constant gguf_context; tensor_id : sys_utypes_uint64_t_h.int64_t) return ggml_h.ggml_type  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_tensor_type";

   function gguf_get_tensor_size (ctx : access constant gguf_context; tensor_id : sys_utypes_uint64_t_h.int64_t) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:133
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_tensor_size";

   function gguf_remove_key (ctx : access gguf_context; key : Interfaces.C.Strings.chars_ptr) return sys_utypes_uint64_t_h.int64_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_remove_key";

   procedure gguf_set_val_u8
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : utypes_uuint8_t_h.uint8_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:139
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_u8";

   procedure gguf_set_val_i8
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : sys_utypes_uint8_t_h.int8_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_i8";

   procedure gguf_set_val_u16
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : utypes_uuint16_t_h.uint16_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_u16";

   procedure gguf_set_val_i16
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : sys_utypes_uint16_t_h.int16_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_i16";

   procedure gguf_set_val_u32
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : utypes_uuint32_t_h.uint32_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:143
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_u32";

   procedure gguf_set_val_i32
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : sys_utypes_uint32_t_h.int32_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_i32";

   procedure gguf_set_val_f32
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : float)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:145
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_f32";

   procedure gguf_set_val_u64
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : utypes_uuint64_t_h.uint64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:146
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_u64";

   procedure gguf_set_val_i64
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : sys_utypes_uint64_t_h.int64_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:147
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_i64";

   procedure gguf_set_val_f64
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : double)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:148
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_f64";

   procedure gguf_set_val_bool
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : Extensions.bool)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_bool";

   procedure gguf_set_val_str
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      val : Interfaces.C.Strings.chars_ptr)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_val_str";

   procedure gguf_set_arr_data
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      c_type : gguf_type;
      data : System.Address;
      n : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_arr_data";

   procedure gguf_set_arr_str
     (ctx : access gguf_context;
      key : Interfaces.C.Strings.chars_ptr;
      data : System.Address;
      n : stddef_h.size_t)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_arr_str";

   procedure gguf_set_kv (ctx : access gguf_context; src : access constant gguf_context)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:159
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_kv";

   procedure gguf_add_tensor (ctx : access gguf_context; tensor : access constant ggml_h.ggml_tensor)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:162
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_add_tensor";

   procedure gguf_set_tensor_type
     (ctx : access gguf_context;
      name : Interfaces.C.Strings.chars_ptr;
      c_type : ggml_h.ggml_type)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_tensor_type";

   procedure gguf_set_tensor_data
     (ctx : access gguf_context;
      name : Interfaces.C.Strings.chars_ptr;
      data : System.Address)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:169
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_set_tensor_data";

   function gguf_write_to_file_ptr
     (ctx : access constant gguf_context;
      file : access int;
      only_meta : Extensions.bool) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:199
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_write_to_file_ptr";

   function gguf_write_to_file
     (ctx : access constant gguf_context;
      fname : Interfaces.C.Strings.chars_ptr;
      only_meta : Extensions.bool) return Extensions.bool  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:200
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_write_to_file";

   function gguf_get_meta_size (ctx : access constant gguf_context) return stddef_h.size_t  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:203
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_meta_size";

   procedure gguf_get_meta_data (ctx : access constant gguf_context; data : System.Address)  -- /Users/tony/dev/_llama-work/llama.cpp/ggml/include/gguf.h:206
   with Import => True, 
        Convention => C, 
        External_Name => "gguf_get_meta_data";

end gguf_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
