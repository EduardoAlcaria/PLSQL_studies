/* Source of PACKAGE EAL_EMPRESA_API is not available */
/
create or replace package body EAL_EMPRESA_API is

   procedure new___(
      item in EAL_EMPRESA_TAB%rowtype
   ) is
   begin
      insert into EAL_EMPRESA_TAB
      values (
         item.cod_emp_id,
         item.cod_cidade,
         item.razao_social,
         item.endereco,
         item.cep,
         item.cnpj,
         item.complemento
      );
   end new___;

   procedure modify___(
      item in EAL_EMPRESA_TAB%rowtype
   ) is
   begin
      update EAL_EMPRESA_TAB
      set
         cod_cidade = item.cod_cidade,
         razao_social = item.razao_social,
         endereco = item.endereco,
         cep = item.cep,
         cnpj = item.cnpj,
         complemento = item.complemento
      where cod_emp_id = item.cod_emp_id;
   end modify___;

   procedure delete___(
      cod_emp_id in EAL_EMPRESA_TAB.cod_emp_id%type
   ) is
   begin
      delete from EAL_EMPRESA_TAB
      where cod_emp_id = delete___cod_emp_id;
   end delete___;

   function get___(
      cod_emp_id in EAL_EMPRESA_TAB.cod_emp_id%type
   ) return EAL_EMPRESA_TAB%rowtype
   is
      ret EAL_EMPRESA_TAB%rowtype;
   begin
      select * into ret from EAL_EMPRESA_TAB
      where cod_emp_id = get___cod_emp_id;
      return ret;
   end get___;

end EAL_EMPRESA_API;
/
