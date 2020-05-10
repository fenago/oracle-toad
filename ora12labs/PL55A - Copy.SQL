create trigger salary_check
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
COMMIT;
raise salary_exception;
end if;
exception
when salary_exception THEN
ROLLBACK WORK;
end;
/
