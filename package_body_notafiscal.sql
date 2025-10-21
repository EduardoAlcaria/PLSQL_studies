create or replace package body EAL_NOTAFISCAL_API is

   procedure new___(
      item in EAL_NOTAFISCAL_TAAB%rowtype
   ) is
   begin
      insert into EAL_NOTAFISCAL_TAAB
      values (
         item.fiscal_note,
         item.serialNF,
         item.cFop,
         item.valorTotal
      );
   end new___;

   procedure modify___(
      item in EAL_NOTAFISCAL_TAAB%rowtype
   ) is
   begin
      update EAL_NOTAFISCAL_TAAB
      set
         serialNF = item.serialNF,
         cFop = item.cFop,
         valorTotal = item.valorTotal
      where fiscal_note = item.fiscal_note;
   end modify___;

   procedure delete___(
      fiscal_note in EAL_NOTAFISCAL_TAAB.fiscal_note%type
   ) is
   begin
      delete from EAL_NOTAFISCAL_TAAB
      where fiscal_note = delete___fiscal_note;
   end delete___;

   function get___(
      fiscal_note in EAL_NOTAFISCAL_TAAB.fiscal_note%type
   ) return EAL_NOTAFISCAL_TAAB%rowtype
   is
      ret EAL_NOTAFISCAL_TAAB%rowtype;
   begin
      select * into ret from EAL_NOTAFISCAL_TAAB
      where fiscal_note = get___fiscal_note;
      return ret;
   end get___;

end EAL_NOTAFISCAL_API;
