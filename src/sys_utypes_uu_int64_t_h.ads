pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package sys_utypes_uu_int64_t_h is

   subtype u_int64_t is Extensions.unsigned_long_long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_u_int64_t.h:30

end sys_utypes_uu_int64_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
