create or replace trigger verify_qty 


before INSERT ON EAL_estoque_TAB
FOR EACH ROW
DECLARE
  quantEstoque EAL_ESTOQUE_TAB.QTYEMESTOQUE%type;
begin
  if :new.Qtyreservada > quantEstoque then
    dbms_output.put_line('qunatidade e muito grande')
  end if;
end ;
