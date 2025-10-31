CREATE OR REPLACE TRIGGER EAL_update_tot_value_nf
before INSERT OR UPDATE OR DELETE ON EAL_notafiscal_TAAB
FOR EACH ROW
DECLARE
    vOld EAL_NOTAFISCAL_TAAB.VALORTOTAL%type;
BEGIN
  if inserting then
   
    
    select valortotal into vOld
    from EAL_NOTAFISCAL_TAAB
    where :new.fiscal_note = (select max(fiscal_note) + 1 from EAL_NOTAFISCAL_TAAB)
    fetch first 1 row  only;
    
    

   :new.valortotal := vOld + :new.valortotal + EAL_NOTAFISCALITEM_API.CalculaValorTotalLinha(:new.fiscal_note);

  elsif updating then
    :new.valortotal := :old.valortotal + :new.valortotal;
  
  else
     dbms_output.put_line('the id ' || :old.fiscal_note || ' is beeing deleted');
  end if;
end;
/
