pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with sys_utypes_h;

package sys_utypes_uoff_t_h is

   subtype off_t is sys_utypes_h.uu_darwin_off_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_off_t.h:31

end sys_utypes_uoff_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
