create or replace package EAL_ESTADO_API is
   procedure new___(
      estado in EAL_Estado_Tab%rowtype
   );

   procedure modify___(
      estado in EAL_Estado_Tab%rowtype
   );

   procedure delete___(
      cod_estado in EAL_Estado_Tab.Cod_Estado%type
   );

   function get___(
      cod_estado in EAL_Estado_Tab.Cod_Estado%type
   ) return EAL_Estado_Tab%rowtype;

end EAL_ESTADO_API;

