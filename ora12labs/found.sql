declare
     var1  number;
     begin
     delete from staff
     where id = 10;
     if sql%found then
     dbms_output.put_line('Deleted record ok ' || sql%rowcount);
     else
     dbms_output.put_line('record not found');
     end if;
     end;
/
