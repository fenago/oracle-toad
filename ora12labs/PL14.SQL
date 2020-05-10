var local_id number
accept local_id PROMPT 'ENTER AN EMPLOYEE ID > '
declare
  max_salary        number(11,2) := 0.0;
  local_id      number(4);
  new_company_name  varchar(25) := 'BCI LTD.';
  staff_record      staff%ROWTYPE;
BEGIN
  select id into :local_id from staff where id = &local_id;
  staff_record.id     := &local_ID;
  staff_record.name   := 'Stallman';
  staff_record.dept   := 10;
  staff_record.job    := 'MGR';
  staff_record.years  := 15;
  staff_record.salary := 45000.00;
  staff_record.comm   := 4000.00;
  insert into staff(id,name,dept,job,years,salary,comm)
    values(staff_record.id,staff_record.name,staff_record.dept,
           staff_record.job,staff_record.years,staff_record.salary,
           staff_record.comm);
  END;
/
