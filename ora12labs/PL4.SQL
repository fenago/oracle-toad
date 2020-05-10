/*  select commission and salary into PL/SQL variables */
/*  If salary is greater than 20000.00 give employee 50 a commission */
/*  of ((salary + bonus) * .05) else insert a new employee  */
DECLARE
bonus number(6,2);
sal number(7,2);
BEGIN
select comm,salary  into bonus,sal from staff
where  id = 50;
IF sal > 20000.00 then
UPDATE staff 
set comm = (sal + bonus * .05)
where  id = 50;
ELSE
INSERT INTO STAFF VALUES(600,'J. RICH',10,'MGR',11,30000,0);
END IF;
COMMIT;
END;
/
