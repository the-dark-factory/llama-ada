pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with System;

package stddef_h is

   --  unsupported macro: NULL __null
   --  arg-macro: procedure offsetof (TYPE, MEMBER)
   --    __builtin_offsetof (TYPE, MEMBER)
   subtype ptrdiff_t is long;  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include/stddef.h:160

   subtype size_t is unsigned_long;  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include/stddef.h:229

   type max_align_t is record
      uu_max_align_ll : aliased Long_Long_Integer;  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include/stddef.h:441
      uu_max_align_ld : aliased long_double;  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include/stddef.h:442
      uu_max_align_f128 : aliased Extensions.Float_128;  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include/stddef.h:448
   end record
   with Convention => C_Pass_By_Copy;  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include/stddef.h:450

   subtype nullptr_t is System.Address;  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include/stddef.h:457

end stddef_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
