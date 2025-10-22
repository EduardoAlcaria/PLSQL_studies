create or replace package body EAL_CIDADE_API is

   procedure new___(
      cidade in EAL_CIDADE_TAB%rowtype
   ) is
   begin
      insert into EAL_CIDADE_TAB
      values (
         cidade.cod_cidade,
         cidade.cod_estado,
         cidade.cod_pais,
         cidade.cod_area,
         cidade.desc_cidaade
      );
   end new___;

   procedure modify___(
      cidade in EAL_CIDADE_TAB%rowtype
   ) is
   begin
      update EAL_CIDADE_TAB
      set
         cod_estado = cidade.cod_estado,
         cod_pais = cidade.cod_pais,
         cod_area = cidade.cod_area,
         desc_cidaade = cidade.desc_cidaade
      where cod_cidade = cidade.cod_cidade;
   end modify___;

   procedure delete___(
      cod_cidade in EAL_CIDADE_TAB.cod_cidade%type
   ) is
   begin
      delete from EAL_CIDADE_TAB
      where cod_cidade = EAL_CIDADE_TAB.cod_cidade;
   end delete___;

   function get___(
      cod_cidade in EAL_CIDADE_TAB.cod_cidade%type
   ) return EAL_CIDADE_TAB%rowtype
   is
      ret EAL_CIDADE_TAB%rowtype;
   begin
      select * into ret from EAL_CIDADE_TAB
      where cod_cidade = EAL_CIDADE_TAB.cod_cidade;
      return ret;
   end get___;

end EAL_CIDADE_API;


