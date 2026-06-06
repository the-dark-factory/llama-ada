pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with stddef_h;
with stdarg_h;
with sys_utypes_uoff_t_h;

package stdio_h is

   FIXINC_WRAP_STDIO_H_STDIO_STDARG_H : constant := 1;  --  /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:11

   BUFSIZ : constant := 1024;  --  /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:119
   EOF : constant := (-1);  --  /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:120

   FOPEN_MAX : constant := 20;  --  /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:123
   FILENAME_MAX : constant := 1024;  --  /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:124

   P_tmpdir : aliased constant String := "/var/tmp/" & ASCII.NUL;  --  /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:128

   L_tmpnam : constant := 1024;  --  /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:130
   TMP_MAX : constant := 308915776;  --  /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:131
   --  unsupported macro: stdin __stdinp
   --  unsupported macro: stdout __stdoutp
   --  unsupported macro: stderr __stderrp

   L_ctermid : constant := 1024;  --  /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:233
   --  arg-macro: procedure getc_unlocked (fp)
   --    __sgetc(fp)
   --  arg-macro: procedure putc_unlocked (x, fp)
   --    __sputc(x, fp)
   --  arg-macro: procedure getchar_unlocked ()
   --    getc_unlocked(stdin)
   --  arg-macro: procedure putchar_unlocked (x)
   --    putc_unlocked(x, stdout)
   --  arg-macro: procedure fropen (cookie, fn)
   --    funopen(cookie, fn, 0, 0, 0)
   --  arg-macro: procedure fwopen (cookie, fn)
   --    funopen(cookie, 0, fn, 0, 0)
   --  arg-macro: procedure feof_unlocked (p)
   --    __sfeof(p)
   --  arg-macro: procedure ferror_unlocked (p)
   --    __sferror(p)
   --  arg-macro: procedure clearerr_unlocked (p)
   --    __sclearerr(p)
   --  arg-macro: procedure fileno_unlocked (p)
   --    __sfileno(p)

   fclose : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "fclose";

   feof : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "feof";

   ferror : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "ferror";

   fflush : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "fflush";

   fgetc : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "fgetc";

   fgetpos : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "fgetpos";

   function fgets
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : access int) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "fgets";

   fprintf : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:161
   with Import => True, 
        Convention => C, 
        External_Name => "fprintf";

   function fputc (arg1 : int; arg2 : access int) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:162
   with Import => True, 
        Convention => C, 
        External_Name => "fputc";

   function fputs (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access int) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:163
   with Import => True, 
        Convention => C, 
        External_Name => "_fputs";

   function fread
     (uu_ptr : System.Address;
      uu_size : stddef_h.size_t;
      uu_nitems : stddef_h.size_t;
      uu_stream : access int) return stddef_h.size_t  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "fread";

   fscanf : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:167
   with Import => True, 
        Convention => C, 
        External_Name => "fscanf";

   fseek : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "fseek";

   fsetpos : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:169
   with Import => True, 
        Convention => C, 
        External_Name => "fsetpos";

   ftell : aliased long  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "ftell";

   function fwrite
     (uu_ptr : System.Address;
      uu_size : stddef_h.size_t;
      uu_nitems : stddef_h.size_t;
      uu_stream : access int) return stddef_h.size_t  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "_fwrite";

   getc : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "getc";

   function getchar return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:173
   with Import => True, 
        Convention => C, 
        External_Name => "getchar";

   function gets (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:180
   with Import => True, 
        Convention => C, 
        External_Name => "gets";

   procedure perror (arg1 : Interfaces.C.Strings.chars_ptr)  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "perror";

   function printf (arg1 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:183
   with Import => True, 
        Convention => C, 
        External_Name => "printf";

   function putc (arg1 : int; arg2 : access int) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:184
   with Import => True, 
        Convention => C, 
        External_Name => "putc";

   function putchar (arg1 : int) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:185
   with Import => True, 
        Convention => C, 
        External_Name => "putchar";

   function puts (arg1 : Interfaces.C.Strings.chars_ptr) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "puts";

   function remove (arg1 : Interfaces.C.Strings.chars_ptr) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:187
   with Import => True, 
        Convention => C, 
        External_Name => "remove";

   function rename (uu_old : Interfaces.C.Strings.chars_ptr; uu_new : Interfaces.C.Strings.chars_ptr) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:188
   with Import => True, 
        Convention => C, 
        External_Name => "rename";

   function scanf (arg1 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:190
   with Import => True, 
        Convention => C, 
        External_Name => "scanf";

   setvbuf : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:192
   with Import => True, 
        Convention => C, 
        External_Name => "setvbuf";

   function sprintf (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:200
   with Import => True, 
        Convention => C, 
        External_Name => "sprintf";

   function sscanf (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:202
   with Import => True, 
        Convention => C, 
        External_Name => "sscanf";

   function tmpnam (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:211
   with Import => True, 
        Convention => C, 
        External_Name => "tmpnam";

   function ungetc (arg1 : int; arg2 : access int) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:213
   with Import => True, 
        Convention => C, 
        External_Name => "ungetc";

   vfprintf : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:214
   with Import => True, 
        Convention => C, 
        External_Name => "vfprintf";

   function vprintf (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : stdarg_h.uu_gnuc_va_list) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:215
   with Import => True, 
        Convention => C, 
        External_Name => "vprintf";

   function vsprintf
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : stdarg_h.uu_gnuc_va_list) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:223
   with Import => True, 
        Convention => C, 
        External_Name => "vsprintf";

   fileno : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:244
   with Import => True, 
        Convention => C, 
        External_Name => "fileno";

   pclose : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:255
   with Import => True, 
        Convention => C, 
        External_Name => "pclose";

   --  skipped func __swbuf

   --  skipped func __sputc

   ftrylockfile : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:312
   with Import => True, 
        Convention => C, 
        External_Name => "ftrylockfile";

   getc_unlocked : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:314
   with Import => True, 
        Convention => C, 
        External_Name => "getc_unlocked";

   function getchar_unlocked return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:315
   with Import => True, 
        Convention => C, 
        External_Name => "getchar_unlocked";

   function putc_unlocked (arg1 : int; arg2 : access int) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:316
   with Import => True, 
        Convention => C, 
        External_Name => "putc_unlocked";

   function putchar_unlocked (arg1 : int) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:317
   with Import => True, 
        Convention => C, 
        External_Name => "putchar_unlocked";

   getw : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:321
   with Import => True, 
        Convention => C, 
        External_Name => "getw";

   function putw (arg1 : int; arg2 : access int) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:322
   with Import => True, 
        Convention => C, 
        External_Name => "putw";

   function tempnam (uu_dir : Interfaces.C.Strings.chars_ptr; uu_prefix : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:331
   with Import => True, 
        Convention => C, 
        External_Name => "_tempnam";

   fseeko : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:354
   with Import => True, 
        Convention => C, 
        External_Name => "fseeko";

   ftello : aliased sys_utypes_uoff_t_h.off_t  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:355
   with Import => True, 
        Convention => C, 
        External_Name => "ftello";

   function snprintf
     (uu_str : Interfaces.C.Strings.chars_ptr;
      uu_size : stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:361
   with Import => True, 
        Convention => C, 
        External_Name => "snprintf";

   vfscanf : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:362
   with Import => True, 
        Convention => C, 
        External_Name => "vfscanf";

   function vscanf (uu_format : Interfaces.C.Strings.chars_ptr; arg2 : stdarg_h.uu_gnuc_va_list) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:363
   with Import => True, 
        Convention => C, 
        External_Name => "vscanf";

   function vsnprintf
     (uu_str : Interfaces.C.Strings.chars_ptr;
      uu_size : stddef_h.size_t;
      uu_format : Interfaces.C.Strings.chars_ptr;
      arg4 : stdarg_h.uu_gnuc_va_list) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:364
   with Import => True, 
        Convention => C, 
        External_Name => "vsnprintf";

   function vsscanf
     (uu_str : Interfaces.C.Strings.chars_ptr;
      uu_format : Interfaces.C.Strings.chars_ptr;
      arg3 : stdarg_h.uu_gnuc_va_list) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:365
   with Import => True, 
        Convention => C, 
        External_Name => "vsscanf";

   sys_nerr : aliased constant int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:394
   with Import => True, 
        Convention => C, 
        External_Name => "sys_nerr";

   sys_errlist : array (size_t) of Interfaces.C.Strings.chars_ptr  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:395
   with Import => True, 
        Convention => C, 
        External_Name => "sys_errlist";

   function asprintf (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:397
   with Import => True, 
        Convention => C, 
        External_Name => "asprintf";

   function ctermid_r (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:398
   with Import => True, 
        Convention => C, 
        External_Name => "ctermid_r";

   fgetln : Interfaces.C.Strings.chars_ptr  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:399
   with Import => True, 
        Convention => C, 
        External_Name => "fgetln";

   function fmtcheck (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:400
   with Import => True, 
        Convention => C, 
        External_Name => "fmtcheck";

   fpurge : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:401
   with Import => True, 
        Convention => C, 
        External_Name => "fpurge";

   setlinebuf : aliased int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:403
   with Import => True, 
        Convention => C, 
        External_Name => "setlinebuf";

   function vasprintf
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : stdarg_h.uu_gnuc_va_list) return int  -- /Users/tony/.alire/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/include-fixed/stdio.h:404
   with Import => True, 
        Convention => C, 
        External_Name => "vasprintf";

end stdio_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
