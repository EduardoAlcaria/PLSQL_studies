create or replace view eal_notafiscal as
select "FISCAL_NOTE","SERIALNF","CFOP","VALORTOTAL", EAL_NOTAFISCALITEM_API.CalculaValorTotalLinha((select item from EAL_NOTAFISCALITEM_TAB where item = fiscal_note)) as valortotalimposto  from EAL_notafiscal_taab order by  fiscal_note asc;
