pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package uctermid_h is

   function ctermid (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/_ctermid.h:38
   with Import => True, 
        Convention => C, 
        External_Name => "ctermid";

end uctermid_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
