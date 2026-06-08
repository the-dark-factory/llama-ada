pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with sys_utypes_uint64_t_h;
with sys_utypes_uu_int64_t_h;

package arm_types_h is

   --  unsupported macro: USER_ADDR_NULL ((user_addr_t) 0)
   --  arg-macro: function CAST_USER_ADDR_T (a_ptr)
   --    return (user_addr_t)((uintptr_t)(a_ptr));
   subtype register_t is sys_utypes_uint64_t_h.int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/types.h:66

   subtype user_addr_t is sys_utypes_uu_int64_t_h.u_int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/types.h:77

   subtype user_size_t is sys_utypes_uu_int64_t_h.u_int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/types.h:78

   subtype user_ssize_t is sys_utypes_uint64_t_h.int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/types.h:79

   subtype user_long_t is sys_utypes_uint64_t_h.int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/types.h:80

   subtype user_ulong_t is sys_utypes_uu_int64_t_h.u_int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/types.h:81

   subtype user_time_t is sys_utypes_uint64_t_h.int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/types.h:82

   subtype user_off_t is sys_utypes_uint64_t_h.int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/types.h:83

   subtype syscall_arg_t is sys_utypes_uu_int64_t_h.u_int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/types.h:105

end arm_types_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
