create or replace package EAL_notafiscal_API is

       procedure new___(
          fiscal_note in Eal_notafiscal_Taab%rowtype
       );

       procedure modify___(
         fiscal_note in Eal_notafiscal_taab%rowtype
       );

       procedure delete___ (
         fiscal_note in Eal_notafiscal_taab.fiscal_note%type 
       );

       function get___(
         fiscal_note in Eal_notafiscal_taab.fiscal_note%type
       )return  Eal_notafiscal_taab%rowtype;

end EAL_notafiscal_API;
/
create or replace package body EAL_NOTAFISCAL_API is

   procedure new___(
      fiscal_note in EAL_NOTAFISCAL_TAAB%rowtype
   ) is
   begin
      insert into EAL_NOTAFISCAL_TAAB
      values (
         fiscal_note.fiscal_note,
         fiscal_note.serialNF,
         fiscal_note.cFop,
         fiscal_note.valorTotal
      );
   end new___;

   procedure modify___(
      fiscal_note in EAL_NOTAFISCAL_TAAB%rowtype
   ) is
   begin
      update EAL_NOTAFISCAL_TAAB
      set
         serialNF = fiscal_note.serialNF,
         cFop = fiscal_note.cFop,
         valorTotal = fiscal_note.valorTotal
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
