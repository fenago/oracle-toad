create OR REPLACE trigger salary_check
before
insert or update of salary,job on staff
for each row
when (new.job<>'CEO')
declare
minsal    number;
maxsal    number;
begin
select min(salary),max(salary)
into     minsal,maxsal
from staff
where job = :new.job;
if :new.salary < minsal or
   :new.salary > maxsal
then INSERT INTO EXCEPTION_TABLE(MESSAGE)
      VALUES('YOU CANNOT INSERT WHILE SELECTING FROM SAME TABLE');
end if;
end;
/
