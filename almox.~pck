/* Source of PACKAGE EAL_ALMOXARIFADO_API is not available */
/
create or replace package body EAL_ALMOXARIFADO_API is

   procedure new___(
      item in EAL_ALMOXARIFADO_TAB%rowtype
   ) is
   begin
      insert into EAL_ALMOXARIFADO_TAB
      values (
         item.codigAlmox,
         item.cod_emp_id,
         item.descAlmox
      );
   end new___;

   procedure modify___(
      item in EAL_ALMOXARIFADO_TAB%rowtype
   ) is
   begin
      update EAL_ALMOXARIFADO_TAB
      set
         cod_emp_id = item.cod_emp_id,
         descAlmox = item.descAlmox
      where codigAlmox = item.codigAlmox;
   end modify___;

   procedure delete___(
      codigAlmox in EAL_ALMOXARIFADO_TAB.codigAlmox%type
   ) is
   begin
      delete from EAL_ALMOXARIFADO_TAB
      where codigAlmox = delete___codigAlmox;
   end delete___;

   function get___(
      codigAlmox in EAL_ALMOXARIFADO_TAB.codigAlmox%type
   ) return EAL_ALMOXARIFADO_TAB%rowtype
   is
      ret EAL_ALMOXARIFADO_TAB%rowtype;
   begin
      select * into ret from EAL_ALMOXARIFADO_TAB
      where codigAlmox = get___codigAlmox;
      return ret;
   end get___;

end EAL_ALMOXARIFADO_API;
/
