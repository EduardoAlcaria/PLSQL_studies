declare
    vPais EAL_PAIS_TAB%rowtype;
    ret EAL_pais_tab%rowtype;
begin
  
    vPais.cod_pais := '4' ;
    vPais.desc_pais := 'pais legal parte 2';
    vPais.cod_area_fone := '51';
    EAL_PAIS_API.modify___(vPais);
   
    select * from EAL_PAIS;
    select * from EAL_NOTAFISCALITEM;
    eal_notafiscalitem.VALORTOTALTEM()
end;
/
