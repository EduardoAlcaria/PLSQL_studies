create or replace package body EAL_PRODUTO_API is

   procedure new___(
      item in EAL_PRODUTO_TAB%rowtype
   ) is
   begin
      insert into EAL_PRODUTO_TAB
      values (
         item.codigo_produto,
         item.descPrduto,
         item.preco
      );
   end new___;

   procedure modify___(
      item in EAL_PRODUTO_TAB%rowtype
   ) is
   begin
      update EAL_PRODUTO_TAB
      set
         descPrduto = item.descPrduto,
         preco = item.preco
      where codigo_produto = item.codigo_produto;
   end modify___;

   procedure delete___(
      codigo_produto in EAL_PRODUTO_TAB.codigo_produto%type
   ) is
   begin
      delete from EAL_PRODUTO_TAB
      where codigo_produto = delete___codigo_produto;
   end delete___;

   function get___(
      codigo_produto in EAL_PRODUTO_TAB.codigo_produto%type
   ) return EAL_PRODUTO_TAB%rowtype
   is
      ret EAL_PRODUTO_TAB%rowtype;
   begin
      select * into ret from EAL_PRODUTO_TAB
      where codigo_produto = get___codigo_produto;
      return ret;
   end get___;

end EAL_PRODUTO_API;
