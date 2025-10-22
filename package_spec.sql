
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
         
         
         
      function getID___(
          cod_pais  in Eal_Pais_Tab.cod_pais;
      )return Eal_Area_Tab.Cod_Area%type;
     
end EAL_PAIS_API;


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

create or replace package EAL_CIDADE_API is
   procedure new___(
      cidade in EAL_Cidade_Tab%rowtype
   );        
   
   procedure modify___(
      cidade in EAL_Cidade_Tab%rowtype
   );
   
   procedure delete___(
      cod_cidade in EAL_Cidade_Tab.Cod_Cidade%type
   );
   
   function get___(
      cod_cidade in EAL_Cidade_Tab.Cod_Cidade%type
   ) return EAL_Cidade_Tab%rowtype;
   
end EAL_CIDADE_API;

create or replace package EAL_CLIENTE_API is
   procedure new___(
      cliente in EAL_Cliente_Tab%rowtype
   );        
   
   procedure modify___(
      cliente in EAL_Cliente_Tab%rowtype
   );
   
   procedure delete___(
      cod_cliente in EAL_Cliente_Tab.Cod_Cliente%type
   );
   
   function get___(
      cod_cliente in EAL_Cliente_Tab.Cod_Cliente%type
   ) 
   return EAL_Cliente_Tab%rowtype;
end EAL_CLIENTE_API;

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

create or replace package EAL_NOTAFISCAL_API is
   procedure new___(
      nf in EAL_NotaFiscal_Taab%rowtype
   );        
   
   procedure modify___(
      nf in EAL_NotaFiscal_Taab%rowtype
   );
   
   procedure delete___(
      fiscal_note in EAL_NotaFiscal_Taab.Fiscal_Note%type
   );
   
   function get___(
      fiscal_note in EAL_NotaFiscal_Taab.Fiscal_Note%type
   ) return EAL_NotaFiscal_Taab%rowtype;
   
   
end EAL_NOTAFISCAL_API;


create or replace package EAL_PRODUTO_API is
   procedure new___(
      produto in EAL_Produto_Tab%rowtype
   );        
   
   procedure modify___(
      produto in EAL_Produto_Tab%rowtype
   );
   
   procedure delete___(
      codigo_produto in EAL_Produto_Tab.Codigo_Produto%type
   );
   
   function get___(
      codigo_produto in EAL_Produto_Tab.Codigo_Produto%type
   ) return EAL_Produto_Tab%rowtype;
   
end EAL_PRODUTO_API;


create or replace package EAL_NOTAFISCALITEM_API is

   procedure new___(
      item in EAL_NotaFiscalItem_Tab%rowtype
   );        
   
   procedure modify___(
      item in EAL_NotaFiscalItem_Tab%rowtype
   );
   
   procedure delete___(
      item in EAL_NotaFiscalItem_Tab.Item%type
   );
   
   function get___(
      item in EAL_NotaFiscalItem_Tab.Item%type
   ) return EAL_NotaFiscalItem_Tab%rowtype;
   
    function CalculaValorTotalLinha(
      item in EAL_NotaFiscalItem_Tab.Item%type    
   )return valorLinha number(20);
   
    function CalculaICMS(
      item in EAL_NotaFiscalItem_Tab.Item%type    
   )return valorLinha number(20);
    
    
    function Calculaalpi(
      item in EAL_NotaFiscalItem_Tab.Item%type    
   )return valorLinha number(20);
   
   
end EAL_NOTAFISCALITEM_API;

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

create or replace package EAL_ESTOQUE_API is
   procedure new___(
      estoque in EAL_Estoque_Tab%rowtype
   );        
   
   procedure modify___(
      estoque in EAL_Estoque_Tab%rowtype
   );
   
   procedure delete___(
      codigAlmox in EAL_Estoque_Tab.CodigAlmox%type,
      codigo_produto in EAL_Estoque_Tab.Codigo_Produto%type
   );
   
   function get___(
      codigAlmox in EAL_Estoque_Tab.CodigAlmox%type,
      codigo_produto in EAL_Estoque_Tab.Codigo_Produto%type
   ) return EAL_Estoque_Tab%rowtype;
   
   
end EAL_ESTOQUE_API;








