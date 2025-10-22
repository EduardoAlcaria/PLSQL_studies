create or replace package EAL_EMPRESA_API is
   procedure new___(
      empresa in EAL_Empresa_Tab%rowtype
   );

   procedure modify___(
      empresa in EAL_Empresa_Tab%rowtype
   );

   procedure delete___(
      cod_emp_id in EAL_Empresa_Tab.Cod_Emp_Id%type
   );

   function get___(
      cod_emp_id in EAL_Empresa_Tab.Cod_Emp_Id%type
   )
    return EAL_Empresa_Tab%rowtype;
end EAL_EMPRESA_API;

