create or replace package EAL_PRODUTO_API is
   procedure new___(
      produto in EAL_Produto_Tab%rowtype
   );

   procedure modify___(
      produto in EAL_Produto_Tab%rowtype
   );

   procedure delete___(
      codigo_produto in EAL_Produto_Tab.Codigo_Produto%type
   );

   function get___(
      codigo_produto in EAL_Produto_Tab.Codigo_Produto%type
   ) return EAL_Produto_Tab%rowtype;

end EAL_PRODUTO_API;


