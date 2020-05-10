create or replace trigger staff_del
     after
     delete on staff
begin
     dbms_output.put_line('after delete trigger fired');
end;