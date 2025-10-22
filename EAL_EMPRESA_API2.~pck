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
/
create or replace package body EAL_EMPRESA_API is

   procedure new___(
      empresa in EAL_EMPRESA_TAB%rowtype
   ) is
   begin
      insert into EAL_EMPRESA_TAB
      values (
         empresa.cod_emp_id,
         empresa.cod_cidade,
         empresa.razao_social,
         empresa.endereco,
         empresa.cep,
         empresa.cnpj,
         empresa.complemento
      );
   end new___;

   procedure modify___(
      empresa in EAL_EMPRESA_TAB%rowtype
   ) is
   begin
      update EAL_EMPRESA_TAB
      set
         cod_cidade = empresa.cod_cidade,
         razao_social = empresa.razao_social,
         endereco = empresa.endereco,
         cep = empresa.cep,
         cnpj = empresa.cnpj,
         complemento = empresa.complemento
      where cod_emp_id = empresa.cod_emp_id;
   end modify___;

   procedure delete___(
      cod_emp_id in EAL_EMPRESA_TAB.cod_emp_id%type
   ) is
   begin
      delete from EAL_EMPRESA_TAB
      where cod_emp_id = EAL_EMPRESA_TAB.cod_emp_id;
   end delete___;

   function get___(
      cod_emp_id in EAL_EMPRESA_TAB.cod_emp_id%type
   ) return EAL_EMPRESA_TAB%rowtype
   is
      ret EAL_EMPRESA_TAB%rowtype;
   begin
      select * into ret from EAL_EMPRESA_TAB
      where cod_emp_id = EAL_EMPRESA_TAB.cod_emp_id;
      return ret;
   end get___;

end EAL_EMPRESA_API;
/
