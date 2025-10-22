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

