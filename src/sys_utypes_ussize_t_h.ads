pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with arm_utypes_h;

package sys_utypes_ussize_t_h is

   subtype ssize_t is arm_utypes_h.uu_darwin_ssize_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_ssize_t.h:31

end sys_utypes_ussize_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
