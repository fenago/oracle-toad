DECLARE
  TYPE emp_table_type IS TABLE OF staff.id%type
  INDEX BY BINARY_INTEGER;
  countr   number(2) := 1;
  v_empid  staff.id%TYPE;
  EMP_TABLE   emp_table_type;
  v_name      staff.name%type := 'Flintstone';
  v_dept      staff.dept%type := '15';
  v_job       staff.job%type  := 'SALES';
  v_years     staff.years%type  := 12;
  v_salary    staff.salary%type := 22123;
  v_comm      staff.comm%type := 234;
  v_team      staff.team%type := 'YELLOW';
BEGIN
  select max(id) into v_empid
  from staff;
  FOR I IN 1..10 LOOP
    emp_table(I) := v_empid + I;
  END LOOP;
  WHILE countr <=10 LOOP
    v_empid := emp_table(countr);
    insert into staff(id,name,dept,job,years,salary,comm,team)
    values(v_empid,v_name,v_dept,v_job,v_years,v_salary,v_comm,v_team);
    countr := countr + 1;
  END LOOP;
END;
/
select * from staff;

/
