create or replace package EAL_PAIS_API is

       procedure new___(
          pais in Eal_Pais_Tab%rowtype

       );
       procedure modify___(
          pais in Eal_Pais_tab%rowtype
       );

       procedure delete___(
         cod_pais in Eal_Pais_tab.Cod_Pais%type
       );

       function get___(
         code_pais in Eal_pais_tab.Cod_Pais%type
       ) return Eal_pais_tab%rowtype;



end EAL_PAIS_API;
/
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
            Eal_Pais_Tab.Desc_Pais = pais.desc_pais,
            Eal_Pais_Tab.Cod_Area_Fone = pais.cod_area_fone

           where Eal_Pais_tab.cod_pais = pais.cod_pais;

        end modify___;


        procedure delete___(
         cod_pais in Eal_Pais_tab.Cod_Pais%type
        )
        is
        begin
          delete from Eal_Pais_Tab pt
          where pt.cod_pais = cod_pais;


        end delete___;

        function get___(
         code_pais in Eal_pais_tab.Cod_Pais%type
        )return Eal_pais_tab%rowtype

        is
          ret Eal_Pais_Tab%rowtype;
        begin

          select * into ret from Eal_Pais_Tab
          where code_pais = Eal_Pais_Tab.cod_pais;
          return ret;

       end get___;

       function getID___(
          cod_pais in Eal_Pais_Tab.cod_pais%type
      )return Eal_pais_Tab.Cod_pais%type
       is
          ret_cod Eal_Pais_Tab.Cod_Pais%type;

       begin
          select Eal_Pais_Tab.Cod_Pais into ret_cod
          from EAL_PAIS_TAB
          where cod_pais = Eal_Pais_Tab.Cod_Pais;
          return ret_cod;
      end getId___;

end EAL_Pais_API;
/
