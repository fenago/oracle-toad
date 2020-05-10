accept p_dept_no  prompt 'Enter a department no > '
DECLARE
dept_no    staff.dept%TYPE := &p_dept_no;
sum_salary   staff.salary%TYPE;
BEGIN
select sum(salary) into sum_salary from staff
where  dept=dept_no;
IF sum_salary > 200000.00 then
UPDATE staff 
set comm = (sum_salary * .005)
where  id = 50;
ELSE
INSERT INTO STAFF VALUES(600,'J. RICH',10,'MGR',11,30000,0);
END IF;
COMMIT;
END;
/
