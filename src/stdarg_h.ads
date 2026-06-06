pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;

package stdarg_h is

   subtype uu_gnuc_va_list is System.Address;  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include/stdarg.h:40

end stdarg_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
