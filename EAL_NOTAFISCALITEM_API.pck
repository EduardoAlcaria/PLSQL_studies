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

---    function CalculaICMS(
---      item in EAL_NotaFiscalItem_Tab.Item%type
---   )return number;


---    function Calculaalpi(
---      item in EAL_NotaFiscalItem_Tab.Item%type
---  )return number;


end EAL_NOTAFISCALITEM_API;
/
create or replace package body EAL_NOTAFISCALITEM_API is

   procedure new___(
      item in EAL_NOTAFISCALITEM_TAB%rowtype
   ) is
   begin
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
   end new___;

   procedure modify___(
      item in EAL_NOTAFISCALITEM_TAB%rowtype
   ) is
   begin
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

     select sum(preco) as sum_preco into ret from EAL_NotaFiscalItem_Tab
     where EAL_NotaFiscalItem_Tab.Item = item;
     return ret;

   end CalculaValorTotalLinha;



end EAL_NOTAFISCALITEM_API;
/
