DECLARE
emp_id      staff.id%TYPE := &p_emp_id;
emp_name    staff.name%TYPE;
emp_dept    staff.dept%TYPE;
emp_salary  staff.salary%TYPE;
BEGIN
select dept,id,name,salary into emp_dept,emp_id,emp_name,emp_salary
from staff where  id = 50;
END;
/
