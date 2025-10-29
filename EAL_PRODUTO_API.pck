create or replace package EAL_PRODUTO_API is
   procedure new___(
      produto in EAL_Produto_Tab%rowtype
   );

   procedure modify___(
      produto in EAL_Produto_Tab%rowtype
   );

   procedure delete___(
      codigo_produto in EAL_Produto_Tab.Codigo_Produto%type
   );

   function get___(
      codigo_produto in EAL_Produto_Tab.Codigo_Produto%type
   ) return EAL_Produto_Tab%rowtype;
   
   function get_desc___(
       codigo_produto in EAL_produto_tab.Codigo_produto%type
     ) return varchar2;
     
   function get_preco___(
     codigo_produto in EAL_produto_tab.Codigo_Produto%type
   ) return number;

end EAL_PRODUTO_API;
/
create or replace package body EAL_PRODUTO_API is

   procedure new___(
      produto in EAL_PRODUTO_TAB%rowtype
   ) is
   begin
     if  produto.codigo_produto is not null and 
         produto.descPrduto is not null and 
         produto.preco is not null then
          insert into EAL_PRODUTO_TAB
          values (
             produto.codigo_produto,
             produto.descPrduto,
             produto.preco
          );
      end if;    
   end new___;

   procedure modify___(
      produto in EAL_PRODUTO_TAB%rowtype
   ) is
   begin
     if  
         produto.descPrduto is not null and 
         produto.preco is not null then
      
          update EAL_PRODUTO_TAB
          set
             descPrduto = produto.descPrduto,
             preco = produto.preco
          where EAL_PRODUTO_TAB.codigo_produto = produto.codigo_produto;
   
     end if;
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
   
   
   function get_desc___(
     codigo_produto in EAL_PRODUTO_TAB.codigo_produto%type
   ) return varchar2
   is
    ret varchar2(255);
   begin
     select DESCPRDUTO into ret from EAL_PRODUTO_TAB
     where codigo_produto = EAL_PRODUTO_TAB.Codigo_Produto;
     return ret;
   end get_desc___;  
     
   function get_preco___(
     codigo_produto in EAL_PRODUTO_TAB.codigo_produto%type 
   ) return number
   is
    ret number(20);
   begin
     select PRECO into ret from EAL_PRODUTO_TAB
     where codigo_produto = EAL_PRODUTO_TAB.Codigo_Produto;  
     return ret;
   
   end get_preco___;
end EAL_PRODUTO_API;
/
