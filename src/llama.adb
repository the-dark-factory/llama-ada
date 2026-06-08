with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
with System;
with Ada.Text_IO;
with Ada.Unchecked_Conversion;
with sys_utypes_uint32_t_h;
with llama_h;

package body Llama with SPARK_Mode => Off is

   function To_Chars_Ptr is new Ada.Unchecked_Conversion
     (System.Address, Interfaces.C.Strings.chars_ptr);

   subtype Int32 is sys_utypes_uint32_t_h.int32_t;

   procedure Generate
     (Model_Path : String;
      Prompt     : String;
      Max_Tokens : Positive := 64)
   is
      type Token_Array is
        array (Natural range <>) of aliased llama_h.llama_token;

      Buf_Size : constant Natural := Prompt'Length + 8;

      M_Params : llama_h.llama_model_params;
      C_Params : llama_h.llama_context_params;
      Model    : access llama_h.llama_model;
      Ctx      : access llama_h.llama_context;
      Vocab    : access constant llama_h.llama_vocab;
      Smpl     : access llama_h.llama_sampler;

      Path_C   : Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String (Model_Path);
      Prompt_C : Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String (Prompt);

      Tokens : aliased Token_Array (0 .. Buf_Size - 1);
      Single : aliased llama_h.llama_token := 0;
      Piece  : aliased Interfaces.C.char_array (0 .. 255);

      N_Tok     : Int32;
      N_Piece   : Int32;
      New_Id    : llama_h.llama_token;
      Batch     : llama_h.llama_batch;
      Cur_Count : Int32;
      Cur_Ptr   : access llama_h.llama_token;
   begin
      llama_h.llama_backend_init;

      M_Params := llama_h.llama_model_default_params;
      Model := llama_h.llama_model_load_from_file (Path_C, M_Params);
      if Model = null then
         raise Program_Error;
      end if;

      Vocab := llama_h.llama_model_get_vocab (Model);

      C_Params := llama_h.llama_context_default_params;
      Ctx := llama_h.llama_init_from_model (Model, C_Params);
      if Ctx = null then
         raise Program_Error;
      end if;

      Smpl := llama_h.llama_sampler_chain_init
                (llama_h.llama_sampler_chain_default_params);
      llama_h.llama_sampler_chain_add
        (Smpl, llama_h.llama_sampler_init_greedy);

      N_Tok := llama_h.llama_tokenize
                 (Vocab,
                  Prompt_C,
                  Int32 (Prompt'Length),
                  Tokens (0)'Access,
                  Int32 (Buf_Size),
                  True,
                  True);

      if N_Tok < 0 then
         raise Program_Error;
      end if;

      Cur_Count := N_Tok;
      Cur_Ptr   := Tokens (0)'Access;

      for I in 1 .. Max_Tokens loop
         Batch := llama_h.llama_batch_get_one (Cur_Ptr, Cur_Count);
         exit when llama_h.llama_decode (Ctx, Batch) /= 0;

         New_Id := llama_h.llama_sampler_sample (Smpl, Ctx, -1);
         exit when llama_h.llama_vocab_is_eog (Vocab, New_Id);

         N_Piece := llama_h.llama_token_to_piece
                      (Vocab,
                       New_Id,
                       To_Chars_Ptr (Piece'Address),
                       Int32 (Piece'Length),
                       0,
                       True);

         for J in 0 .. Integer (N_Piece) - 1 loop
            Ada.Text_IO.Put (Interfaces.C.To_Ada (Piece (size_t (J))));
         end loop;
         Ada.Text_IO.Flush;

         Single    := New_Id;
         Cur_Ptr   := Single'Access;
         Cur_Count := 1;
      end loop;

      llama_h.llama_sampler_free (Smpl);
      llama_h.llama_free (Ctx);
      llama_h.llama_model_free (Model);
      llama_h.llama_backend_free;
      Interfaces.C.Strings.Free (Path_C);
      Interfaces.C.Strings.Free (Prompt_C);
   end Generate;

end Llama;
