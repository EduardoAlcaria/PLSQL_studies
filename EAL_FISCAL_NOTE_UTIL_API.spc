create or replace package EAL_FISCAL_NOTE_UTIL_API is

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
                         
     procedure product_collection(
   tab out EAL_PRODUCT_TYPE_TAB
  );  
                           
end EAL_FISCAL_NOTE_UTIL_API;
/
