declare
         emp_sal    number(9,2) := &a_monthly_salary;
         BEGIN
         :g_year_sal := emp_sal * 12;
         end;
/
