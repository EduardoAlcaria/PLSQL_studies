declare
    fiscal EAL_notafiscal_TAAB%rowtype;
    retEST varchar2(255);

begin
    
 fiscal.fiscal_note := 5;
 fiscal.serialnf := 112313;
 fiscal.cfop := 12312;
 fiscal.valortotal := 1;

 
 EAL_notafiscal_API.new___(fiscal);





end;
/
