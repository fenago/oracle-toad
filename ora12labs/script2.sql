var g_salary number
DECLARE
STAFF_REC      STAFF%ROWTYPE;
TOT_COMP       NUMBER(11,2) := 0;
BONUS          NUMBER(11,2) := 0;
BEGIN
select (salary + nvl(comm,0)) + nvl(comm,0) * .05
 into :g_salary from staff where id = &empid; 
END;
/
print g_salary
