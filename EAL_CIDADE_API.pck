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
   
   function get_pais___(
      cod_cidade in EAL_CIDADE_TAB.Cod_Cidade%type
   )return varchar2;
   
   function get_estado___(
      cod_cidade in EAL_CIDADE_TAB.Cod_Cidade%type
   )return varchar2;
   
   function get_area___(
      cod_cidade in EAL_CIDADE_TAB.Cod_Cidade%type
   )return varchar2;
   
   function get_desc___(
      cod_cidade in EAL_CIDADE_TAB.Cod_Cidade%type
   )return varchar2;
   
   

end EAL_CIDADE_API;
/
create or replace package body EAL_CIDADE_API is

   procedure new___(
      cidade in EAL_CIDADE_TAB%rowtype
   ) is
   begin
     if cidade.cod_cidade is not null and
       cidade.cod_estado is not null and 
         cidade.cod_pais is not null and
         cidade.cod_area is not null and
         cidade.desc_cidaade is not null then
       
          insert into EAL_CIDADE_TAB
          values (
             cidade.cod_cidade,
             cidade.cod_estado,
             cidade.cod_pais,
             cidade.cod_area,
             cidade.desc_cidaade
          );
          
     end if;     
   end new___;

   procedure modify___(
      cidade in EAL_CIDADE_TAB%rowtype
   ) is
   begin
       if cidade.cod_cidade is not null and
          cidade.cod_estado is not null and 
          cidade.cod_pais is not null and
          cidade.cod_area is not null and
          cidade.desc_cidaade is not null then
          update EAL_CIDADE_TAB
          set
             cod_estado = cidade.cod_estado,
             cod_pais = cidade.cod_pais,
             cod_area = cidade.cod_area,
             desc_cidaade = cidade.desc_cidaade
          where cod_cidade = cidade.cod_cidade;
       end if;   
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
   
   function get_pais___(
      cod_cidade in EAL_CIDADE_TAB.Cod_Cidade%type
   )return varchar2
   is
      ret varchar2(255);
   begin
     select EAL_CIDADE_TAB.COD_PAIS into ret from EAL_CIDADE_TAB
     where cod_cidade = EAL_CIDADE_TAB.cod_cidade;
     return ret;
   end get_pais___;
   
   function get_area___(
      cod_cidade in EAL_CIDADE_TAB.Cod_Cidade%type
   )return varchar2
   is
      ret varchar2(255);
   begin
     select EAL_CIDADE_TAB.COD_area into ret from EAL_CIDADE_TAB
     where cod_cidade = EAL_CIDADE_TAB.cod_cidade;
     return ret;
   end get_area___;
   
   
   function get_estado___(
      cod_cidade in EAL_CIDADE_TAB.Cod_Cidade%type
   )return varchar2
   is
      ret varchar2(255);
   begin
     select EAL_CIDADE_TAB.COD_ESTADO into ret from EAL_CIDADE_TAB
     where cod_cidade = EAL_CIDADE_TAB.cod_cidade;
     return ret;
   end get_estado___;
   
   
   function get_desc___(
      cod_cidade in EAL_CIDADE_TAB.Cod_Cidade%type
   )return varchar2
   is
      ret varchar2(255);
   begin
     select EAL_CIDADE_TAB.desc_cidaade into ret from EAL_CIDADE_TAB
     where cod_cidade = EAL_CIDADE_TAB.cod_cidade;
     return ret;
   end get_desc___;
   
   
   
   
end EAL_CIDADE_API;
/
