create or replace package EAL_cliente_API is

       procedure new___(
          cliente in Eal_cliente_Tab%rowtype

       );

       procedure modify___(
         cliente Eal_cliente_tab%rowtype
       );

       procedure remove___ (
         cliente_id in Eal_cliente_tab.Cod_cliente%type
       );

       function get___(
         cliente_id in Eal_cliente_tab.Cod_cliente%type
         
       )return Eal_Cliente_tab%rowtype;

end EAL_cliente_API;
/
create or replace package body EAL_CLIENTE_API is

   procedure new___(
      cliente in EAL_CLIENTE_TAB%rowtype
   ) is
   begin
      insert into EAL_CLIENTE_TAB
      values (
         cliente.cod_cliente,
         cliente.cod_cidade,
         cliente.cod_estado,
         cliente.cod_pais,
         cliente.cliente_name,
         cliente.cpf,
         cliente.rg,
         cliente.ativo
      );
   end new___;

   procedure modify___(
      cliente in EAL_CLIENTE_TAB%rowtype
   ) is
   begin
      update EAL_CLIENTE_TAB
      set
         cod_cidade = cliente.cod_cidade,
         cod_estado = cliente.cod_estado,
         cod_pais = cliente.cod_pais,
         cliente_name = cliente.cliente_name,
         cpf = cliente.cpf,
         rg = cliente.rg,
         ativo = cliente.ativo
      where cod_cliente = cliente.cod_cliente;
   end modify___;

   procedure remove___(
      cliente_id in EAL_CLIENTE_TAB.cod_cliente%type
   ) is
   begin
      delete from EAL_CLIENTE_TAB
      where cliente_id = EAL_CLIENTE_TAB.cod_cliente;
   end remove___;

   function get___(
      cliente_id in EAL_CLIENTE_TAB.cod_cliente%type
   ) return EAL_CLIENTE_TAB%rowtype
   is
      ret EAL_CLIENTE_TAB%rowtype;
   begin
      select * into ret from EAL_CLIENTE_TAB
      where cliente_id = EAL_CLIENTE_TAB.cod_cliente;
      return ret;
   end get___;

end EAL_CLIENTE_API;
/
