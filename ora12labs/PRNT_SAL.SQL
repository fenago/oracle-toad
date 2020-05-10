CREATE OR REPLACE PROCEDURE PRNT_SAL
 (V_EMP_ID IN staff.id%type := &EMPID,
  V_SALARY OUT staff.salary%type)
is
BEGIN
select salary into v_salary
from staff
where id = v_emp_id;
end prnt_sal;
/
