create or replace trigger eal_verify_qty


before INSERT ON EAL_estoque_TAB
FOR EACH ROW
DECLARE
 e_invalid_qty exception;
begin
  if :new.Qtyreservada > :new.qtyemestoque then
    raise e_invalid_qty;
  end if;
  
  exception
    when e_invalid_qty then
      dbms_output.put_line('ERROR: quantidade reservada maior que a disponivel em estoque');
      delete from EAL_ESTOQUE_TAB where EAL_ESTOQUE_TAB.QTYRESERVADA = :new.Qtyreservada;
      
end ;
/
