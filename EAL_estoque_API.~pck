create or replace package EAL_estoque_API is

       procedure new___(
         codigalmox in Eal_estoque_Tab%rowtype

       );

       procedure modify___(
         codigalmox in Eal_estoque_tab%rowtype
       );

       procedure delete___ (
         codigalmox in Eal_estoque_tab%rowtype
       );

       function get___(
        codigalmox in Eal_estoque_tab.codigalmox%type 
        
       )return Eal_estoque_tab%rowtype;

end EAL_estoque_API;
/
create or replace package body EAL_ESTOQUE_API is

   procedure new___(
      codigalmox in EAL_ESTOQUE_TAB%rowtype
   ) is
   begin
      insert into EAL_ESTOQUE_TAB
      values (
         codigalmox.qtyReservada,
         codigalmox.codigAlmox,
         codigalmox.qtyEmEstoque,
         codigalmox.codigo_produto
      );
   end new___;

   procedure modify___(
      codigalmox in EAL_ESTOQUE_TAB%rowtype
   ) is
   begin
      update EAL_ESTOQUE_TAB
      set
         qtyReservada = codigalmox.qtyReservada,
         qtyEmEstoque = codigalmox.qtyEmEstoque
      where codigAlmox = codigalmox.codigAlmox
        and codigo_produto = codigalmox.codigo_produto;
   end modify___;

   procedure delete___(
      codigalmox in Eal_estoque_tab%rowtype
   ) is
   begin
      delete from EAL_ESTOQUE_TAB
      where codigalmox = EAL_ESTOQUE_TAB.codigAlmox;

   end delete___;

   function get___(
      codigAlmox in EAL_ESTOQUE_TAB.codigAlmox%type
   ) return EAL_ESTOQUE_TAB%rowtype
   is
      ret EAL_ESTOQUE_TAB%rowtype;
   begin
      select * into ret from EAL_ESTOQUE_TAB
      where codigAlmox = EAL_ESTOQUE_TAB.codigAlmox
        and codigo_produto = EAL_ESTOQUE_TAB.codigo_produto;
      return ret;
   end get___;

end EAL_ESTOQUE_API;
/
