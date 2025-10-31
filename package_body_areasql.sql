 create or replace package body EAL_area_API is
 
       procedure new___(
          area in Eal_area_Tab%rowtype
       )
       is 
       begin
         insert into EAL_AREA_TAB values (
         area.cod_area,
         area.desc_area;
      );
      end new___;
       

       procedure modify___(
        area in EAL_AREA_TAB%rowtype
       ) is
       begin
          update EAL_AREA_TAB
          set
             cod_area = area.cod_area,
             desc_area = area.desc_area;
          where cod_area = area.cod_area;
          
       end modify___;
       
       
       procedure delete___ (
         id in Eal_area_tab.Cod_area%type 
       )is
        begin
           delete from EAL_area_TAB
           where cod_area = EAL_area_TAB.cod_area;
       end delete___;

       function get___(
       cod_area in EAL_area_TAB.cod_area%type
       ) return EAL_area_TAB%rowtype
       is
          ret EAL_area_TAB%rowtype;
       begin
          select * into ret from EAL_area_TAB
          where  cod_area = EAL_area_TAB.cod_area;
          return ret;
       end get___;
