create or replace package EAL_CLIENTE_API is
   procedure new___(
      cliente in EAL_Cliente_Tab%rowtype
   );

   procedure modify___(
      cliente in EAL_Cliente_Tab%rowtype
   );

   procedure remove___(
      cod_cliente in EAL_Cliente_Tab.Cod_Cliente%type
   );

   function get___(
      cod_cliente in EAL_Cliente_Tab.Cod_Cliente%type
   )
   return EAL_Cliente_Tab%rowtype;
end EAL_CLIENTE_API;
/
