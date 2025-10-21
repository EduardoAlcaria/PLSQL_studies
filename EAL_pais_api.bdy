create or replace package body EAL_pais_api is

         procedure new___ (
             pais in Eal_Pais_Tab%rowtype

          )
          is
          begin
             insert into Eal_Pais_Tab
             values
             (pais.cod_pais, pais.desc_pais, pais.cod_area_fone);
        end new___;

        procedure modify___(
           pais in EAL_PAIS_TAB%rowtype
        )
        is
        begin
          update Eal_Pais_Tab
            set
            Eal_Pais_Tab.Cod_Pais = pais.cod_pais,
            Eal_Pais_Tab.Desc_Pais = pais.desc_pais,
            Eal_Pais_Tab.Cod_Area_Fone = pais.cod_area_fone

          where Eal_Pais_tab.cod_pais = pais.cod_pais;
        end modify___;


end EAL_Pais_API;
/
