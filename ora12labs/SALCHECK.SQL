create trigger SAL_check
before
insert or update of salary,job on staff
for each row
when (new.job<>'CEO')
declare
minsal    number;
maxsal    number;
salary_exception  EXCEPTION;
begin
select min(salary),max(salary)
into     minsal,maxsal
from staff
where job = :new.job;
if :new.salary < minsal or
   :new.salary >  maxsal THEN
INSERT INTO EXCEPTION_TABLE (MESSAGE)
VALUES ('INVALID SALARY VALUE TRAPPED FOR STAFF TABLE'||SYSDATE);
raise salary_exception;
end if;
end;
/
