create or replace package EAL_ESTOQUE_API is
   procedure new___(
      estoque in EAL_Estoque_Tab%rowtype
   );

   procedure modify___(
      estoque in EAL_Estoque_Tab%rowtype
   );

   procedure delete___(
      codigAlmox in EAL_Estoque_Tab.CodigAlmox%type,
      codigo_produto in EAL_Estoque_Tab.Codigo_Produto%type
   );

   function get___(
      codigAlmox in EAL_Estoque_Tab.CodigAlmox%type,
      codigo_produto in EAL_Estoque_Tab.Codigo_Produto%type
   ) return EAL_Estoque_Tab%rowtype;


end EAL_ESTOQUE_API;
