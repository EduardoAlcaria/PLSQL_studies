create or replace package EAL_ESTADO_API is
   procedure new___(
      estado in EAL_Estado_Tab%rowtype
   );

   procedure modify___(
      estado in EAL_Estado_Tab%rowtype
   );

   procedure delete___(
      cod_estado in EAL_Estado_Tab.Cod_Estado%type
   );

   function get___(
      cod_estado in EAL_Estado_Tab.Cod_Estado%type
   ) return EAL_Estado_Tab%rowtype;

end EAL_ESTADO_API;
/
create or replace package body EAL_ESTADO_API is

   procedure new___(
      estado in EAL_ESTADO_TAB%rowtype
   ) is
   begin
      insert into EAL_ESTADO_TAB
      values (estado.cod_estado, estado.cod_pais, estado.desc_estado, estado.cod_area_fone);
   end new___;

   procedure modify___(
      item in EAL_ESTADO_TAB%rowtype
   ) is
   begin
      update EAL_ESTADO_TAB
      set
         cod_pais = estado.cod_pais,
         desc_estado = estado.desc_estado,
         cod_area_fone = item.cod_area_fone
      where cod_estado = item.cod_estado;
   end modify___;

   procedure delete___(
      cod_estado in EAL_ESTADO_TAB.cod_estado%type
   ) is
   begin
      delete from EAL_ESTADO_TAB
      where cod_estado = EAL_estado_tab.cod_estado;
   end delete___;

   function get___(
      cod_estado in EAL_ESTADO_TAB.cod_estado%type
   ) return EAL_ESTADO_TAB%rowtype
   is
      ret EAL_ESTADO_TAB%rowtype;
   begin
      select * into ret from EAL_ESTADO_TAB
      where cod_estado = EAL_ESTADO_TAB.cod_estado;
      return ret;
   end get___;

end EAL_ESTADO_API;
/
