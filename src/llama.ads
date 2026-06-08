--  Llama -- a small hand-authored convenience layer over the generated
--  llama.cpp binding (package Llama_H). One entry point: load a GGUF model
--  and stream a generated continuation of a prompt to standard output.
--
--  This spec is the hand-authored interface (the moat). The body is FORGED
--  against the generated binding, then compile-gated -- not hand-written.

package Llama with SPARK_Mode => Off is

   --  Load the GGUF model at Model_Path, generate up to Max_Tokens tokens
   --  continuing Prompt, and stream the decoded text to standard output.
   --  Initialises and tears down the llama.cpp backend internally.
   --  Raises Program_Error if the model or context fails to initialise.
   procedure Generate
     (Model_Path : String;
      Prompt     : String;
      Max_Tokens : Positive := 64);

end Llama;
