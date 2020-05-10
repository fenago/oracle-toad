alter table staff
add constraint ck_staff_salary
check (salary > 0)
/
