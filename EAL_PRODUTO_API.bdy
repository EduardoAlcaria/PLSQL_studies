create or replace package body EAL_PRODUTO_API is

   procedure new___(
      produto in EAL_PRODUTO_TAB%rowtype
   ) is
   begin
      insert into EAL_PRODUTO_TAB
      values (
         produto.codigo_produto,
         produto.descPrduto,
         produto.preco
      );
   end new___;

   procedure modify___(
      produto in EAL_PRODUTO_TAB%rowtype
   ) is
   begin
      update EAL_PRODUTO_TAB
      set
         descPrduto = produto.descPrduto,
         preco = produto.preco
      where EAL_PRODUTO_TAB.codigo_produto = produto.codigo_produto;
   end modify___;

   procedure delete___(
      codigo_produto in EAL_PRODUTO_TAB.codigo_produto%type
   ) is
   begin
      delete from EAL_PRODUTO_TAB
      where codigo_produto = Eal_Produto_Tab.codigo_produto;
   end delete___;

   function get___(
      codigo_produto in EAL_PRODUTO_TAB.codigo_produto%type
   ) return EAL_PRODUTO_TAB%rowtype
   is
      ret EAL_PRODUTO_TAB%rowtype;
   begin
      select * into ret from EAL_PRODUTO_TAB
      where codigo_produto = EAL_PRODUTO_TAB.codigo_produto;
      return ret;
   end get___;

end EAL_PRODUTO_API;
/
