declare
  max_salary        number(11,2) := 0.0;
  new_company_name  varchar(25) := 'TEXAS INSTRUMENTS';
  staff_record      staff%ROWTYPE;
BEGIN
  staff_record.id     := 1090;
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
