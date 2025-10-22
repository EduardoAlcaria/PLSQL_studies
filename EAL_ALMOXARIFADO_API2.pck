create or replace package EAL_ALMOXARIFADO_API is
   procedure new___(
      almox in EAL_Almoxarifado_Tab%rowtype
   );

   procedure modify___(
      almox in EAL_Almoxarifado_Tab%rowtype
   );

   procedure delete___(
      codigAlmox in EAL_Almoxarifado_Tab.CodigAlmox%type
   );

   function get___(
      codigAlmox in EAL_Almoxarifado_Tab.CodigAlmox%type
   ) return EAL_Almoxarifado_Tab%rowtype;




end EAL_ALMOXARIFADO_API;
/
create or replace package body EAL_ALMOXARIFADO_API is

   procedure new___(
      almox in EAL_ALMOXARIFADO_TAB%rowtype
   ) is
   begin
      insert into EAL_ALMOXARIFADO_TAB
      values (
         almox.codigAlmox,
         almox.cod_emp_id,
         almox.descAlmox
      );
   end new___;

   procedure modify___(
      almox in EAL_ALMOXARIFADO_TAB%rowtype
   ) is
   begin
      update EAL_ALMOXARIFADO_TAB
      set
         cod_emp_id = almox.cod_emp_id,
         descAlmox = almox.descAlmox
      where codigAlmox = almox.codigAlmox;
   end modify___;

   procedure delete___(
      codigAlmox in EAL_ALMOXARIFADO_TAB.codigAlmox%type
   ) is
   begin
      delete from EAL_ALMOXARIFADO_TAB
      where codigAlmox = EAL_ALMOXARIFADO_TAB.codigAlmox;
   end delete___;

   function get___(
      codigAlmox in EAL_ALMOXARIFADO_TAB.codigAlmox%type
   ) return EAL_ALMOXARIFADO_TAB%rowtype
   is
      ret EAL_ALMOXARIFADO_TAB%rowtype;
   begin
      select * into ret from EAL_ALMOXARIFADO_TAB
      where codigAlmox =  EAL_ALMOXARIFADO_TAB.codigAlmox;
      return ret;
   end get___;

end EAL_ALMOXARIFADO_API;
/
