create or replace type EAL_NOTAFISCALITEM_TYPE as object(
             item varchar2(255),
             notafiscal varchar2(255),
             codigoProduto varchar(255),
             qtyVenda varchar2(255) ,
             preco number,
             icmsPerc number,
             valorIcms number,
             valorIpi number,
             valorTotalTem number
);
/
