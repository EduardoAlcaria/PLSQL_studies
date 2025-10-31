create or replace package EAL_FISCAL_NOTE_UTIL_API is

   function CalculaValorTotalLinhaF(
      item in EAL_NotaFiscalItem_Tab.Item%type
    )return number;

    function CalculaIcmsF(
        nfi EAL_NOTAFISCALITEM_TAB%rowtype,
        nf EAL_NOTAFISCAL_TAAB%rowtype

     )return number;


     FUNCTION CalculaIpiF(pItem EAL_NOTAFISCALITEM_TAB.Item%TYPE,
                           pNota_Fiscal_Id EAL_NOTAFISCALITEM_TAB.NOTAFISCAL%TYPE
                           )return number;
                         
     procedure product_collectionF(
   tab out EAL_PRODUCT_TYPE_TAB
  );  
  procedure calcula_totalF(
       tab out EAL_NOTAFISCALITEM_TYPE_TAB
     );
                           
end EAL_FISCAL_NOTE_UTIL_API;
/
create or replace package body EAL_FISCAL_NOTE_UTIL_API is

   function CalculaValorTotalLinhaF(
      item in EAL_NotaFiscalItem_Tab.Item%type
   )return number
   is
     ret number;
   begin
    
     select (preco * qtyvenda) + icmsPerc + valorIcms + valorIpi + valorTotalTem into ret from EAL_NotaFiscalItem_Tab
     where EAL_NotaFiscalItem_Tab.Item = item
     FETCH FIRST 1 ROWS ONLY;
     return ret;
     

   end CalculaValorTotalLinhaF;

    function CalculaIcmsF(
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
         end CalculaIcmsF;
         
      FUNCTION CalculaIpiF(pitem EAL_NOTAFISCALITEM_TAB.ITEM%TYPE,
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
         END CalculaIpiF;
         
     procedure product_collectionF(
    tab out EAL_PRODUCT_TYPE_TAB  
   )
   is
   begin
     select EAL_PRODUCT_TYPE(codigo_produto, descprduto, preco)
     bulk collect into tab
     from EAL_PRODUTO_TAB;
     
   end product_collectionF;

   PROCEDURE calcula_totalF(
    tab OUT EAL_NOTAFISCALITEM_TYPE_TAB
)
IS
    acumun NUMBER := 0;
    vOld   EAL_NOTAFISCAL_taab.Valortotal%type;
BEGIN

    SELECT EAL_NOTAFISCALITEM_TYPE(item,
                                   notafiscal,
                                   codigoProduto,
                                   qtyVenda,
                                   preco,
                                   icmsPerc,
                                   valorIcms,
                                   valorIpi,
                                   valorTotalTem)
      BULK COLLECT INTO tab
      FROM EAL_NOTAFISCALITEM_TAB;

    FOR i IN 1 .. tab.COUNT LOOP
        BEGIN
            SELECT valortotal
              INTO vOld
              FROM EAL_notafiscal_TAAB
             WHERE fiscal_note = (SELECT MAX(fiscal_note) FROM EAL_NOTAFISCAL_TAAB)
               AND ROWNUM = 1;

            acumun := acumun + vOld + EAL_NOTAFISCALITEM_API.CalculaValorTotalLinha(tab(i).item);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                vOld := 0;
        END;

        DBMS_OUTPUT.PUT_LINE('Acumulado: ' || acumun);
    END LOOP;
END calcula_totalF;



end EAL_FISCAL_NOTE_UTIL_API;
/
