create or replace package EAL_CIDADE_API is
   procedure new___(
      cidade in EAL_Cidade_Tab%rowtype
   );

   procedure modify___(
      cidade in EAL_Cidade_Tab%rowtype
   );

   procedure delete___(
      cod_cidade in EAL_Cidade_Tab.Cod_Cidade%type
   );

   function get___(
      cod_cidade in EAL_Cidade_Tab.Cod_Cidade%type
   ) return EAL_Cidade_Tab%rowtype;

end EAL_CIDADE_API;
/
create or replace package body EAL_CIDADE_API is

   procedure new___(
      item in EAL_CIDADE_TAB%rowtype
   ) is
   begin
      insert into EAL_CIDADE_TAB
      values (
         item.cod_cidade,
         item.cod_estado,
         item.cod_pais,
         item.cod_area,
         item.desc_cidaade
      );
   end new___;

   procedure modify___(
      item in EAL_CIDADE_TAB%rowtype
   ) is
   begin
      update EAL_CIDADE_TAB
      set
         cod_estado = item.cod_estado,
         cod_pais = item.cod_pais,
         cod_area = item.cod_area,
         desc_cidaade = item.desc_cidaade
      where cod_cidade = item.cod_cidade;
   end modify___;

   procedure delete___(
      cod_cidade in EAL_CIDADE_TAB.cod_cidade%type
   ) is
   begin
      delete from EAL_CIDADE_TAB
      where cod_cidade = delete___cod_cidade;
   end delete___;

   function get___(
      cod_cidade in EAL_CIDADE_TAB.cod_cidade%type
   ) return EAL_CIDADE_TAB%rowtype
   is
      ret EAL_CIDADE_TAB%rowtype;
   begin
      select * into ret from EAL_CIDADE_TAB
      where cod_cidade = get___cod_cidade;
      return ret;
   end get___;

end EAL_CIDADE_API;
/
