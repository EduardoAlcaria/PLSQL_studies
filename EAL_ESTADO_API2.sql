create or replace package EAL_NOTAFISCAL_API is
   procedure new___(
      nf in EAL_NotaFiscal_Taab%rowtype
   );

   procedure modify___(
      nf in EAL_NotaFiscal_Taab%rowtype
   );

   procedure delete___(
      fiscal_note in EAL_NotaFiscal_Taab.Fiscal_Note%type
   );

   function get___(
      fiscal_note in EAL_NotaFiscal_Taab.Fiscal_Note%type
   ) return EAL_NotaFiscal_Taab%rowtype;


end EAL_NOTAFISCAL_API;


