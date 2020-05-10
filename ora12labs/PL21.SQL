DECLARE
emp_id    staff.id%TYPE;
emp_name   staff.name%TYPE :='J Sulivan';
emp_dept   staff.dept%TYPE := &p_dept_no;
emp_job    staff.job%TYPE := 'PROG';
emp_years  staff.years%TYPE := 0;
emp_salary  staff.salary%TYPE;
emp_comm    staff.comm%TYPE;
BEGIN
select max(id) into emp_id from staff;
emp_id := emp_id + 1;
insert into staff (id,name,dept,job,years,salary,comm)
values(emp_id,emp_name,emp_dept,emp_job,emp_years,emp_salary,emp_comm);
commit work;
END;
/
