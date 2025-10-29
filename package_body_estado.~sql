create or replace package body EAL_ESTADO_API is

   procedure new___(
      item in EAL_ESTADO_TAB%rowtype
   ) is
   begin
      insert into EAL_ESTADO_TAB
      values (item.cod_estado, item.cod_pais, item.desc_estado, item.cod_area_fone);
   end new___;

   procedure modify___(
      item in EAL_ESTADO_TAB%rowtype
   ) is
   begin
      update EAL_ESTADO_TAB
      set
         cod_pais = item.cod_pais,
         desc_estado = item.desc_estado,
         cod_area_fone = item.cod_area_fone
      where cod_estado = item.cod_estado;
   end modify___;

   procedure delete___(
      cod_estado in EAL_ESTADO_TAB.cod_estado%type
   ) is
   begin
      delete from EAL_ESTADO_TAB
      where cod_estado = delete___cod_estado;
   end delete___;

   function get___(
      cod_estado in EAL_ESTADO_TAB.cod_estado%type
   ) return EAL_ESTADO_TAB%rowtype
   is
      ret EAL_ESTADO_TAB%rowtype;
   begin
      select * into ret from EAL_ESTADO_TAB
      where cod_estado = get___cod_estado;
      return ret;
   end get___;

end EAL_ESTADO_API;
