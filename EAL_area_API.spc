create or replace package EAL_area_API is

       procedure new___(
          area in Eal_area_Tab%rowtype

       );

       procedure modify___(
         area_table in Eal_area_tab%rowtype
       );

       procedure remove___ (
         id in Eal_area_tab.Cod_area%type 
       );

       function get___(
         area_id in Eal_area_tab.Cod_area%type
         
       ) return Eal_area_tab%rowtype;

end  EAL_area_API;
/
