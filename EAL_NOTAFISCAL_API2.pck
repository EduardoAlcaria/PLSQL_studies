create or replace package body EAL_NOTAFISCAL_API is

   procedure new___(
      nf in EAL_NOTAFISCAL_TAAB%rowtype
   ) is
   begin
      insert into EAL_NOTAFISCAL_TAAB
      values (
         nf.fiscal_note,
         nf.serialNF,
         nf.cFop,
         nf.valorTotal
      );
   end new___;

   procedure modify___(
      nf in EAL_NOTAFISCAL_TAAB%rowtype
   ) is
   begin
      update EAL_NOTAFISCAL_TAAB
      set
         serialNF = nf.serialNF,
         cFop = nf.cFop,
         valorTotal = nf.valorTotal
      where fiscal_note = EAL_NOTAFISCAL_TAAB.fiscal_note;
   end modify___;

   procedure delete___(
      fiscal_note in EAL_NOTAFISCAL_TAAB.fiscal_note%type
   ) is
   begin
      delete from EAL_NOTAFISCAL_TAAB
      where fiscal_note = EAL_NOTAFISCAL_TAAB.fiscal_note;
   end delete___;

   function get___(
      fiscal_note in EAL_NOTAFISCAL_TAAB.fiscal_note%type
   ) return EAL_NOTAFISCAL_TAAB%rowtype
   is
      ret EAL_NOTAFISCAL_TAAB%rowtype;
   begin
      select * into ret from EAL_NOTAFISCAL_TAAB
      where fiscal_note = EAL_NOTAFISCAL_TAAB.fiscal_note;
      return ret;
   end get___;

end EAL_NOTAFISCAL_API;
/
