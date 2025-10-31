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
    
        FUNCTION GetRazaoSocial___(pCodigo_Emp_Id EAL_EMPRESA_TAB.Cod_Emp_Id%TYPE)
         RETURN EAL_EMPRESA_TAB.Razao_Social%TYPE;

       FUNCTION GetEndereco___(pCodigo_Emp_Id EAL_EMPRESA_TAB.Cod_Emp_Id%TYPE)
         RETURN EAL_EMPRESA_TAB.Endereco%TYPE;

       FUNCTION GetCep___(pCodigo_Emp_Id EAL_EMPRESA_TAB.Cod_Emp_Id%TYPE)
         RETURN EAL_EMPRESA_TAB.Cep%TYPE;

       FUNCTION GetCnpj___(pCodigo_Emp_Id EAL_EMPRESA_TAB.Cod_Emp_Id%TYPE)
         RETURN EAL_EMPRESA_TAB.Cnpj%TYPE;

       FUNCTION GetComplemento___(pCodigo_Emp_Id EAL_EMPRESA_TAB.Cod_Emp_Id%TYPE)
         RETURN EAL_EMPRESA_TAB.Complemento%TYPE;

    
    
    
        
    
end EAL_EMPRESA_API;
/
create or replace package body EAL_EMPRESA_API is

   procedure new___(
      empresa in EAL_EMPRESA_TAB%rowtype
   ) is
   begin
     if empresa.cod_emp_id is not null and
         empresa.cod_cidade is not null and
         empresa.razao_social is not null and
         empresa.endereco is not null and 
         empresa.cep is not null and 
         empresa.cnpj is not null and 
         empresa.complemento is not null then
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
      end if;    
   end new___;

   procedure modify___(
      empresa in EAL_EMPRESA_TAB%rowtype
   ) is
   begin
      if empresa.cod_emp_id is not null and
         empresa.cod_cidade is not null and
         empresa.razao_social is not null and
         empresa.endereco is not null and 
         empresa.cep is not null and 
         empresa.cnpj is not null and 
         empresa.complemento is not null then
            update EAL_EMPRESA_TAB
            set
               cod_cidade = empresa.cod_cidade,
               razao_social = empresa.razao_social,
               endereco = empresa.endereco,
               cep = empresa.cep,
               cnpj = empresa.cnpj,
               complemento = empresa.complemento
            where cod_emp_id = empresa.cod_emp_id;
            
      end if;      
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
   
   
    FUNCTION GetRazaoSocial___(pCodigo_Emp_Id EAL_EMPRESA_TAB.Cod_Emp_Id%TYPE)
         RETURN EAL_EMPRESA_TAB.Razao_Social%TYPE
         IS
          vRaz EAL_EMPRESA_TAB.Razao_Social%TYPE;
         BEGIN
           SELECT Razao_Social
           INTO vRaz
           FROM EAL_EMPRESA_TAB
           WHERE Cod_Emp_Id = pCodigo_Emp_Id;

           RETURN vRaz;
         END GetRazaoSocial___;

       FUNCTION GetEndereco___(pCodigo_Emp_Id EAL_EMPRESA_TAB.Cod_Emp_Id%TYPE)
         RETURN EAL_EMPRESA_TAB.Endereco%TYPE
         IS
          vEndr EAL_EMPRESA_TAB.Endereco%TYPE;
         BEGIN
           SELECT Endereco
           INTO vEndr
           FROM EAL_EMPRESA_TAB
           WHERE Cod_Emp_Id = pCodigo_Emp_Id;

           RETURN vEndr;
         END GetEndereco___;

       FUNCTION GetCep___(pCodigo_Emp_Id EAL_EMPRESA_TAB.Cod_Emp_Id%TYPE)
         RETURN EAL_EMPRESA_TAB.Cep%TYPE
         IS
          vCep EAL_EMPRESA_TAB.Cep%TYPE;
         BEGIN
           SELECT Cep
           INTO vCep
           FROM EAL_EMPRESA_TAB
           WHERE Cod_Emp_Id = pCodigo_Emp_Id;

           RETURN vCep;
         END GetCep___;

       FUNCTION GetCnpj___(pCodigo_Emp_Id EAL_EMPRESA_TAB.Cod_Emp_Id%TYPE)
         RETURN EAL_EMPRESA_TAB.Cnpj%TYPE
         IS
          vCnpj EAL_EMPRESA_TAB.Cnpj%TYPE;
         BEGIN
           SELECT Cnpj
           INTO vCnpj
           FROM EAL_EMPRESA_TAB
           WHERE Cod_Emp_Id = pCodigo_Emp_Id;

           RETURN vCnpj;
         END GetCnpj___;

       FUNCTION GetComplemento___(pCodigo_Emp_Id EAL_EMPRESA_TAB.Cod_Emp_Id%TYPE)
         RETURN EAL_EMPRESA_TAB.Complemento%TYPE
         IS
          vCompl EAL_EMPRESA_TAB.Complemento%TYPE;
         BEGIN
           SELECT Complemento
           INTO vCompl
           FROM EAL_EMPRESA_TAB
           WHERE Cod_Emp_Id = pCodigo_Emp_Id;

           RETURN vCompl;
         END GetComplemento___;

end EAL_EMPRESA_API;
/
