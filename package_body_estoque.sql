create or replace package body EAL_ESTOQUE_API is

   procedure new___(
      item in EAL_ESTOQUE_TAB%rowtype
   ) is
   begin
      insert into EAL_ESTOQUE_TAB
      values (
         item.qtyReservada,
         item.codigAlmox,
         item.qtyEmEstoque,
         item.codigo_produto
      );
   end new___;

   procedure modify___(
      item in EAL_ESTOQUE_TAB%rowtype
   ) is
   begin
      update EAL_ESTOQUE_TAB
      set
         qtyReservada = item.qtyReservada,
         qtyEmEstoque = item.qtyEmEstoque
      where codigAlmox = item.codigAlmox
        and codigo_produto = item.codigo_produto;
   end modify___;

   procedure delete___(
      codigAlmox in EAL_ESTOQUE_TAB.codigAlmox%type,
      codigo_produto in EAL_ESTOQUE_TAB.codigo_produto%type
   ) is
   begin
      delete from EAL_ESTOQUE_TAB
      where codigAlmox = delete___codigAlmox
        and codigo_produto = delete___codigo_produto;
   end delete___;

   function get___(
      codigAlmox in EAL_ESTOQUE_TAB.codigAlmox%type,
      codigo_produto in EAL_ESTOQUE_TAB.codigo_produto%type
   ) return EAL_ESTOQUE_TAB%rowtype
   is
      ret EAL_ESTOQUE_TAB%rowtype;
   begin
      select * into ret from EAL_ESTOQUE_TAB
      where codigAlmox = get___codigAlmox
        and codigo_produto = get___codigo_produto;
      return ret;
   end get___;

end EAL_ESTOQUE_API;
