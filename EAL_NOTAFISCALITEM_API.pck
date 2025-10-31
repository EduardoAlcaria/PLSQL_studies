create or replace package EAL_NOTAFISCALITEM_API is

   procedure new___(
      item in EAL_NotaFiscalItem_Tab%rowtype
   );

   procedure modify___(
      item in EAL_NotaFiscalItem_Tab%rowtype
   );

   procedure delete___(
      item in EAL_NotaFiscalItem_Tab.Item%type
   );

   function get___(
      item in EAL_NotaFiscalItem_Tab.Item%type
   ) return EAL_NotaFiscalItem_Tab%rowtype;

    function CalculaValorTotalLinha(
      item in EAL_NotaFiscalItem_Tab.Item%type
   )return number;
   
    function CalculaIcms(
        nfi EAL_NOTAFISCALITEM_TAB%rowtype,
        nf EAL_NOTAFISCAL_TAAB%rowtype
        
       )return number;


     FUNCTION CalculaIpi(pItem EAL_NOTAFISCALITEM_TAB.Item%TYPE,
                           pNota_Fiscal_Id EAL_NOTAFISCALITEM_TAB.NOTAFISCAL%TYPE
                           )return number;


      FUNCTION GetQtyVenda___(
                 pItem EAL_NOTAFISCALITEM_TAB.Item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.QtyVenda%TYPE;

       FUNCTION GetPreco___(
                 pItem EAL_NOTAFISCALITEM_TAB.Item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.Preco%TYPE;

       FUNCTION GetIcmsPerc___(
                 pItem EAL_NOTAFISCALITEM_TAB.Item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.IcmsPerc%TYPE;

       FUNCTION GetIpiPerc___(
                 pItem EAL_NOTAFISCALITEM_TAB.Item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.valoripi%TYPE;

       FUNCTION GetValorIcms___(
                 pItem EAL_NOTAFISCALITEM_TAB.Item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.ValorIcms%TYPE;

       FUNCTION GetValorIpi___(
                 pItem EAL_NOTAFISCALITEM_TAB.Item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.ValorIpi%TYPE;

       FUNCTION GetValorTotalItem___(
                 pItem EAL_NOTAFISCALITEM_TAB.Item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.ValorTotaltem%TYPE;
     
     procedure calcula_total(
      tab out EAL_NOTAFISCALITEM_TYPE_TAB
     );

end EAL_NOTAFISCALITEM_API;
/
create or replace package body EAL_NOTAFISCALITEM_API is

   procedure new___(
      item in EAL_NOTAFISCALITEM_TAB%rowtype
   ) is
   begin
     if  item.item  is not null and 
         item.notafiscal   is not null and 
         item.codigoProduto   is not null and 
         item.qtyVenda   is not null and 
         item.preco  is not null and 
         item.icmsPerc  is not null and 
         item.valorIcms  is not null and 
         item.valorIpi  is not null and 
         item.valorTotalTem   is not null then 
          insert into EAL_NOTAFISCALITEM_TAB
          values (
             item.item,
             item.notafiscal,
             item.codigoProduto,
             item.qtyVenda,
             item.preco,
             item.icmsPerc,
             item.valorIcms,
             item.valorIpi,
             item.valorTotalTem
          );
     end if; 
   end new___;

   procedure modify___(
      item in EAL_NOTAFISCALITEM_TAB%rowtype
   ) is
   begin
      if  item.item  is not null and 
         item.notafiscal   is not null and 
         item.codigoProduto   is not null and 
         item.qtyVenda   is not null and 
         item.preco  is not null and 
         item.icmsPerc  is not null and 
         item.valorIcms  is not null and 
         item.valorIpi  is not null and 
         item.valorTotalTem   is not null then 
          update EAL_NOTAFISCALITEM_TAB
          set
             notafiscal = item.notafiscal,
             codigoProduto = item.codigoProduto,
             qtyVenda = item.qtyVenda,
             preco = item.preco,
             icmsPerc = item.icmsPerc,
             valorIcms = item.valorIcms,
             valorIpi = item.valorIpi,
             valorTotalTem = item.valorTotalTem
          where item = item.item;
       end if;   
   end modify___;

   procedure delete___(
      item in EAL_NOTAFISCALITEM_TAB.item%type
   ) is
   begin
      delete from EAL_NOTAFISCALITEM_TAB
      where item = EAL_NOTAFISCALITEM_TAB.item;
   end delete___;

   function get___(
      item in EAL_NOTAFISCALITEM_TAB.item%type
   ) return EAL_NOTAFISCALITEM_TAB%rowtype
   is
      ret EAL_NOTAFISCALITEM_TAB%rowtype;
   begin
      select * into ret from EAL_NOTAFISCALITEM_TAB
      where item = EAL_NOTAFISCALITEM_TAB.item;
      return ret;
   end get___;


    function CalculaValorTotalLinha(
      item in EAL_NotaFiscalItem_Tab.Item%type
   )return number
   is
     ret number;
   begin
    
     select (preco * qtyvenda) + icmsPerc + valorIcms + valorIpi + valorTotalTem into ret from EAL_NotaFiscalItem_Tab
     where EAL_NotaFiscalItem_Tab.Item = item
     FETCH FIRST 1 ROWS ONLY;
     return ret;
     

   end CalculaValorTotalLinha;
   
 
     function CalculaIcms(
        nfi EAL_NOTAFISCALITEM_TAB%rowtype,
        nf EAL_NOTAFISCAL_TAAB%rowtype
        
       )return number
       is
         vValor number;
         begin
           select (nfi.icmsperc / 100) * (nfi.Preco * nfi.QtyVenda)
           into vValor
           from EAL_NOTAFISCALITEM_TAB
           where nf.fiscal_note = nfi.notafiscal
           FETCH FIRST 1 ROWS ONLY;
      

           return vValor;
         end CalculaIcms;
         
      FUNCTION CalculaIpi(pitem EAL_NOTAFISCALITEM_TAB.ITEM%TYPE,
                           pNota_Fiscal_Id EAL_NOTAFISCALITEM_TAB.NOTAFISCAL%TYPE)
       RETURN NUMBER
       IS
         vValor NUMBER;
         BEGIN
           SELECT (valorIpi / 100) * (Preco * QtyVenda)
           INTO vValor
           FROM EAL_NOTAFISCALITEM_TAB
           WHERE Item = pitem
           AND notafiscal = pNota_Fiscal_Id;

           RETURN vValor;
         END CalculaIpi;
         
         
       FUNCTION GetQtyVenda___(
                 pItem EAL_NOTAFISCALITEM_TAB.Item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.QtyVenda%TYPE
         IS
          myVar EAL_NOTAFISCALITEM_TAB.QtyVenda%TYPE;
         BEGIN
           SELECT QtyVenda
           INTO myVar
           FROM EAL_NOTAFISCALITEM_TAB
           WHERE item = pitem
           AND notafiscal = pNota_Fiscal_Id;

           RETURN myVar;
         END GetQtyVenda___;


       FUNCTION GetPreco___(
                 pitem  EAL_NOTAFISCALITEM_TAB.item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.Preco%TYPE
         IS
          myVar EAL_NOTAFISCALITEM_TAB.Preco%TYPE;
         BEGIN
           SELECT Preco
           INTO myVar
           FROM EAL_NOTAFISCALITEM_TAB
           WHERE item = pitem
           AND notafiscal = pNota_Fiscal_Id;

           RETURN myVar;
         END GetPreco___;


       FUNCTION GetIcmsPerc___(
                 pitem  EAL_NOTAFISCALITEM_TAB.item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.IcmsPerc%TYPE
         IS
          myVar EAL_NOTAFISCALITEM_TAB.IcmsPerc%TYPE;
         BEGIN
           SELECT IcmsPerc
           INTO myVar
           FROM EAL_NOTAFISCALITEM_TAB
           WHERE item = pitem
           AND notafiscal = pNota_Fiscal_Id;

           RETURN myVar;
         end GetIcmsPerc___;

       FUNCTION GetIpiPerc___(
                 pitem  EAL_NOTAFISCALITEM_TAB.item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.valoripi%TYPE
         IS
          myVar EAL_NOTAFISCALITEM_TAB.valoripi%TYPE;
         BEGIN
           SELECT valoripi
           INTO myVar
           FROM EAL_NOTAFISCALITEM_TAB
           WHERE item = pitem
           AND notafiscal = pNota_Fiscal_Id;

           RETURN myVar;
         END GetIpiPerc___;

       FUNCTION GetValorIcms___(
                 pitem  EAL_NOTAFISCALITEM_TAB.item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.ValorIcms%TYPE
         IS
          myVar EAL_NOTAFISCALITEM_TAB.ValorIcms%TYPE;
         BEGIN
           SELECT ValorIcms
           INTO myVar
           FROM EAL_NOTAFISCALITEM_TAB
           WHERE item = pitem
           AND notafiscal = pNota_Fiscal_Id;

           RETURN myVar;
         END GetValorIcms___;

       FUNCTION GetValorIpi___(
                 pitem  EAL_NOTAFISCALITEM_TAB.item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN EAL_NOTAFISCALITEM_TAB.ValorIpi%TYPE
         IS
          myVar EAL_NOTAFISCALITEM_TAB.ValorIpi%TYPE;
         BEGIN
           SELECT ValorIpi
           INTO myVar
           FROM EAL_NOTAFISCALITEM_TAB
           WHERE item = pitem
           AND notafiscal = pNota_Fiscal_Id;

           RETURN myVar;
         END GetValorIpi___;

       FUNCTION GetValorTotalItem___(
                 pitem  EAL_NOTAFISCALITEM_TAB.item%TYPE,
                 pNota_Fiscal_Id  EAL_NOTAFISCALITEM_TAB.notafiscal%TYPE
                 )
         RETURN  EAL_NOTAFISCALITEM_TAB.ValorTotaltem%TYPE
         IS
          myVar  EAL_NOTAFISCALITEM_TAB.ValorTotaltem%TYPE;
         BEGIN
           SELECT ValorTotaltem
           INTO myVar
           FROM EAL_NOTAFISCALITEM_TAB
           WHERE item = pitem
           AND notafiscal = pNota_Fiscal_Id;

           RETURN myVar;
         END GetValorTotalItem___;    

      procedure calcula_total(
       tab out EAL_NOTAFISCALITEM_TYPE_TAB
     )
     is
       acumun number;
     begin
       select EAL_NOTAFISCALITEM_TYPE(item,
             notafiscal,
             codigoProduto,
             qtyVenda,
             preco,
             icmsPerc,
             valorIcms,
             valorIpi,
             valorTotalTem )
        bulk collect into tab
        from EAL_NOTAFISCALITEM_TAB;
        
        for i in 1 .. tab.count loop
          acumun := acumun + EAL_NOTAFISCALITEM_API.CalculaValorTotalLinha(tab(i).item);
        
        dbms_output.put_line(acumun);
        end loop;     


     end calcula_total;
end EAL_NOTAFISCALITEM_API;
/
