DECLARE
  v_error_job   EXCEPTION;
  v_error_dept  EXCEPTION;
  countr   number(2) := 1;
  v_empid     staff.id%TYPE;
  v_name      staff.name%type := '&empname';
  v_dept      staff.dept%type := &dept;
  v_job       staff.job%type  := '&job';
  v_years     staff.years%type  := &years;
  v_salary    staff.salary%type := &salary;
  v_comm      staff.comm%type := &commission;
  TEMP_JOB    STAFF.JOB%TYPE;
  temp_dept   staff.dept%type;
BEGIN
--select distinct dept into temp_dept from staff
--WHERE v_dept = dept;
IF V_DEPT = 84
THEN raise v_error_dept;
END IF;
DBMS_OUTPUT.PUT_LINE('V_JOB = '||V_JOB);
SELECT DISTINCT JOB INTO TEMP_JOB
FROM STAFF
WHERE JOB = UPPER(V_JOB);

select max(id) + 1 into v_empid from staff;
insert into staff (id,name,dept,job,years,salary,comm)
values(v_empid,v_name,v_dept,v_job,v_years,v_salary,v_comm);
COMMIT;
EXCEPTION
  when v_error_dept then
    --rollback;
    insert into exception_table(message)
    values('Department Number is invalid');
    commit;
  when no_data_found then
    --rollback;
    insert into exception_table(message)
    values('No data found');
    commit;
  when others then
    --rollback;
    insert into exception_table(message)
    values('Other error occurred');
    commit;
END;
/    
--select * from staff;

