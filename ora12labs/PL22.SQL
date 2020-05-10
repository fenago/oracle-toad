DECLARE
emp_id     staff.id%TYPE := &p_emp_id;
emp_salary   staff.salary%TYPE :=&p_salary;
emp_comm     staff.comm%TYPE;
BEGIN
UPDATE staff 
set salary = emp_salary, comm = (emp_salary *.05)
where  id = emp_id;
COMMIT;
END;
/
