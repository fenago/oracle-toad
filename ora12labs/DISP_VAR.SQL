create or replace procedure disp_var
as aNumber number;
begin
   FOR J IN 1..10 LOOP
   aNumber := J * 2;
   dbms_output.put_line(to_char(aNumber));
   END LOOP;
END;
/
