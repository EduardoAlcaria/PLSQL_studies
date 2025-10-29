
CREATE OR REPLACE TRIGGER EAL_after_insert_cidade
BEFORE INSERT ON EAL_cidade_TAB
FOR EACH ROW


BEGIN
   :new.cod_cidade := EAL_SEQ_CIDADE_ID.Nextval;

end;
/
