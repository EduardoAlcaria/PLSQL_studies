create or replace view eal_empresa as
select "COD_EMP_ID","COD_CIDADE","RAZAO_SOCIAL","ENDERECO", EAL_EMPRESA_API.formata_cep((select cep from EAL_EMPRESA_TAB)) as CEP , 
EAL_EMPRESA_API.formata_cnpj((select cnpj from EAL_EMPRESA_TAB)) as CNPJ, "COMPLEMENTO" from EAL_empresa_tab order by cod_emp_id;
