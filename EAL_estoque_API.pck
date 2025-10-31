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
   

   
   function get_qtyReservada___(
    codigAlmox in EAL_ESTOQUE_TAB.codigAlmox%type
   ) return number;

   
   function get_QTYEMESTOQUE___(
     codigAlmox in EAL_ESTOQUE_TAB.codigAlmox%type
   ) return number;
    
   
     

end EAL_ESTOQUE_API;
/
create or replace package body EAL_ESTOQUE_API is

   procedure new___(
      estoque in EAL_ESTOQUE_TAB%rowtype
   ) is
   begin
     if estoque.qtyReservada is not null and 
         estoque.codigAlmox is not null and 
         estoque.qtyEmEstoque is not null and 
         estoque.codigo_produto is not null then
      insert into EAL_ESTOQUE_TAB
      values (
         estoque.qtyReservada,
         estoque.codigAlmox,
         estoque.qtyEmEstoque,
         estoque.codigo_produto
      );
     end if; 
   end new___;

   procedure modify___(
      estoque in EAL_ESTOQUE_TAB%rowtype
   ) is
   begin
       if estoque.qtyReservada is not null and 
         estoque.codigAlmox is not null and 
         estoque.qtyEmEstoque is not null and 
         estoque.codigo_produto is not null then
          update EAL_ESTOQUE_TAB
          set
             qtyReservada = estoque.qtyReservada,
             qtyEmEstoque = estoque.qtyEmEstoque
          where codigAlmox = estoque.codigAlmox
            and codigo_produto = estoque.codigo_produto;
        end if;
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
              AND codigAlmox = pCodigo_Almox
              fetch first 1 row only;
             
           SELECT QtyReservada
             INTO vQtyReservada
             FROM EAL_ESTOQUE_TAB
            WHERE Codigo_Produto = pCodigo_Produto
              AND codigAlmox = pCodigo_Almox
              fetch first 1 row  only;                  
           RETURN vQtyReservada - vQtyEstoque;
         END CalculoQtyDisponivel;
         
   function get_qtyReservada___(
     codigAlmox in EAL_ESTOQUE_TAB.codigAlmox%type
   ) return number
   is
    ret number(20);
   begin
     select qtyReservada into ret from EAL_ESTOQUE_TAB
     where codigAlmox = EAL_ESTOQUE_TAB.CODIGALMOX;
     return ret;
     
   end get_qtyReservada___;  

   function get_QTYEMESTOQUE___(
     codigAlmox in EAL_ESTOQUE_TAB.codigAlmox%type
   ) return number
   is
    ret number(20);
   begin
     select QTYEMESTOQUE into ret from EAL_ESTOQUE_TAB
     where codigAlmox = EAL_ESTOQUE_TAB.CODIGALMOX;
     return ret;
   
   
   end get_QTYEMESTOQUE___;
   



end EAL_ESTOQUE_API;
/
