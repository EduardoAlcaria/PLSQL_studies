declare
    cliente EAL_CLIENTE_TAB%rowtype;
    tab eal_notafiscalitem_type_tab;
    ret varchar2(32);
begin

 --ret := EAL_CLIENTE_API.valida_cpf('111.444.777-35');
 --dbms_output.put_line(ret);
 
 cliente.cod_cliente := 2;
 cliente.cod_cidade := 1;
 cliente.cod_estado := 1;
 cliente.cod_pais := 1;
 cliente.cliente_name := 'ednaldo';
 cliente.cpf := '11144477735';
 cliente.rg := 22222;
 cliente.ativo := 'False';
 
 
 ret := EAL_CLIENTE_API.formata_cpf(cliente.cpf);
 dbms_output.put_line('cpf formated ' || ret);
 
 

 EAL_FISCAL_NOTE_UTIL_API.calcula_totalF(tab);
 
 
 
 ret := EAL_EMPRESA_API.formata_cnpj('123-45678912345');
 dbms_output.put_line('CNPJ ' || ret);
 
 ret := EAL_EMPRESA_API.formata_cep('9447-0550');
 dbms_output.put_line('CEP ' || ret);
 
 
 
 select * from EAL_EMPRESA;
 
 --select * from eal_cliente_Tab;
 --aselect * from eal_produto;
 
-- select * from EAL_NOTAFISCAL;
 
end;
/
