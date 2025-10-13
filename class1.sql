

--- 1st class
declare
    vNum number(11,2) := 500;
    vNum2 number(11,2) := 500;
    vAvg number(11,2);

begin
  vAvg := (vNum + vNum2)/2;
  dbms_output.put_line('hello world');
  dbms_output.put_line(vAvg);
end;
