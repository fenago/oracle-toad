declare
   TYPE employee_record_type is record
  ( first_name varchar2(10) not null := ' ',
   last_name   varchar2(15) not null := ' ',
   dept        number(4),
   age  number(3),
   salary  number(7,2),
   years_emp  number(2) := 0,
   comm    staff.comm%TYPE);
staff_record employee_record_type;
BEGIN
 select name, dept,name,years,salary,years,comm
 into staff_record.first_name,staff_record.dept,staff_record.last_name,
 staff_record.age,staff_record.salary,staff_record.years_emp,
 staff_record.comm from staff where id = 20;
END;
/
