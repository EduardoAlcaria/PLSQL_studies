create or replace package body EAL_ESTADO_API is
   procedure new___(
      estado in EAL_Estado_Tab%rowtype
   )is
   begin
      insert into EAL_ESTADO_TAB
      values (
         estado.cod_estado,
         estado.cod_pais,
         estado.desc_estado,
         estado.cod_area_fone
      );
   end new___;

   procedure modify___(
      estado in EAL_Estado_Tab%rowtype
   )is
   begin
      update EAL_estado_TAB
      set
         cod_estado = estado.cod_estado,  
         cod_pais = estado.cod_pais,
         desc_estado = estado.desc_estado,
         cod_area_fone = estado.cod_area_fone
      where cod_emp_id = empresa.cod_emp_id;
   end modify___;

   procedure delete___(
      cod_estado in EAL_Estado_Tab.Cod_Estado%type
   )begin
      delete from EAL_estado_TAB
      where cod_estado = EAL_estado_TAB.cod_estado;
   end delete___;


   function get___(
      cod_estado in EAL_Estado_Tab.Cod_Estado%type
   ) return EAL_Estado_Tab%rowtype
   is
      ret EAL_estado_TAB%rowtype;
   begin
      select * into ret from EAL_Estado_TAB
      where cod_estado = EAL_estado_TAB.cod_estado;
      return ret;
   end get___;
;
