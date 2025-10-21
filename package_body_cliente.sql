create or replace package body EAL_CLIENTE_API is

   procedure new___(
      item in EAL_CLIENTE_TAB%rowtype
   ) is
   begin
      insert into EAL_CLIENTE_TAB
      values (
         item.cod_cliente,
         item.cod_cidade,
         item.cod_estado,
         item.cod_pais,
         item.cliente_name,
         item.cpf,
         item.rg,
         item.ativo
      );
   end new___;

   procedure modify___(
      item in EAL_CLIENTE_TAB%rowtype
   ) is
   begin
      update EAL_CLIENTE_TAB
      set
         cod_cidade = item.cod_cidade,
         cod_estado = item.cod_estado,
         cod_pais = item.cod_pais,
         cliente_name = item.cliente_name,
         cpf = item.cpf,
         rg = item.rg,
         ativo = item.ativo
      where cod_cliente = item.cod_cliente;
   end modify___;

   procedure delete___(
      cod_cliente in EAL_CLIENTE_TAB.cod_cliente%type
   ) is
   begin
      delete from EAL_CLIENTE_TAB
      where cod_cliente = delete___cod_cliente;
   end delete___;

   function get___(
      cod_cliente in EAL_CLIENTE_TAB.cod_cliente%type
   ) return EAL_CLIENTE_TAB%rowtype
   is
      ret EAL_CLIENTE_TAB%rowtype;
   begin
      select * into ret from EAL_CLIENTE_TAB
      where cod_cliente = get___cod_cliente;
      return ret;
   end get___;

end EAL_CLIENTE_API;
