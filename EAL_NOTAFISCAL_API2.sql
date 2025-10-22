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
   )return valorLinha number(20);

    function CalculaICMS(
      item in EAL_NotaFiscalItem_Tab.Item%type
   )return valorLinha number(20);


    function Calculaalpi(
      item in EAL_NotaFiscalItem_Tab.Item%type
   )return valorLinha number(20);


end EAL_NOTAFISCALITEM_API;

