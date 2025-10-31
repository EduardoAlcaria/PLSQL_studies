create or replace view eal_cliente as
select "COD_CLIENTE","COD_CIDADE","COD_ESTADO","COD_PAIS","CLIENTE_NAME",EAL_CLIENTE_API.formata_cpf(cpf) as CPF,"RG","ATIVO" from EAL_cliente_tab order by cod_cliente;
