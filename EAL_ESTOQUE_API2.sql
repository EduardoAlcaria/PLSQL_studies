create or replace package EAL_ESTOQUE_API is
   procedure new___(
      estoque in EAL_Estoque_Tab%rowtype
   );

   procedure modify___(
      estoque in EAL_Estoque_Tab%rowtype
   );

   procedure delete___(
      codigAlmox in EAL_Estoque_Tab.CodigAlmox%type
   );

   function get___(
      codigAlmox in EAL_Estoque_Tab.CodigAlmox%type

   ) return EAL_Estoque_Tab%rowtype;
   
    
    
   FUNCTION CalculoQtyDisponivel(pCodigo_Produto EAL_ESTOQUE_TAB.codigo_produto%TYPE,
                 pCodigo_Almox EAL_ESTOQUE_TAB.codigAlmox%TYPE)
       RETURN NUMBER;
      

end EAL_ESTOQUE_API;
/
create or replace package body EAL_ESTOQUE_API is

   procedure new___(
      estoque in EAL_ESTOQUE_TAB%rowtype
   ) is
   begin
      insert into EAL_ESTOQUE_TAB
      values (
         estoque.qtyReservada,
         estoque.codigAlmox,
         estoque.qtyEmEstoque,
         estoque.codigo_produto
      );
   end new___;

   procedure modify___(
      estoque in EAL_ESTOQUE_TAB%rowtype
   ) is
   begin
      update EAL_ESTOQUE_TAB
      set
         qtyReservada = estoque.qtyReservada,
         qtyEmEstoque = estoque.qtyEmEstoque
      where codigAlmox = estoque.codigAlmox
        and codigo_produto = estoque.codigo_produto;
   end modify___;

   procedure delete___(
      codigalmox in Eal_estoque_tab.Codigalmox%type
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
   
    FUNCTION CalculoQtyDisponivel(pCodigo_Produto EAL_ESTOQUE_TAB.codigo_produto%TYPE,
                 pCodigo_Almox EAL_ESTOQUE_TAB.codigAlmox%TYPE)
       RETURN NUMBER
       IS
       vQtyEstoque NUMBER;
       vQtyReservada NUMBER;
         BEGIN
           SELECT qtyEmEstoque
             INTO vQtyEstoque
             FROM EAL_ESTOQUE_TAB
            WHERE Codigo_Produto = pCodigo_Produto
              AND codigAlmox = pCodigo_Almox;

           SELECT QtyReservada
             INTO vQtyReservada
             FROM EAL_ESTOQUE_TAB
            WHERE Codigo_Produto = pCodigo_Produto
              AND codigAlmox = pCodigo_Almox;

           RETURN vQtyReservada - vQtyEstoque;
         END CalculoQtyDisponivel;

end EAL_ESTOQUE_API;
/
