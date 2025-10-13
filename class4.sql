
variable gAvg number;

declare
     vN1 number(5, 0) := 5000;
      vN2 number(5, 0) := 5000;
begin
  :gAvg := (vN1 + vN2) / 2;
  dbms_output.put_line(:gAvg);
end;
