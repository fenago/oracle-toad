declare
v_salary  number(7,2) :=0;
begin
select salary into v_salary
from staff;
end;
/
