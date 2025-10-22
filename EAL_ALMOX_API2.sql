create or replace package EAL_ALMOXARIFADO_API is
   procedure new___(
      almox in EAL_Almoxarifado_Tab%rowtype
   );

   procedure modify___(
      almox in EAL_Almoxarifado_Tab%rowtype
   );

   procedure delete___(
      codigAlmox in EAL_Almoxarifado_Tab.CodigAlmox%type
   );

   function get___(
      codigAlmox in EAL_Almoxarifado_Tab.CodigAlmox%type
   ) return EAL_Almoxarifado_Tab%rowtype;




end EAL_ALMOXARIFADO_API;

