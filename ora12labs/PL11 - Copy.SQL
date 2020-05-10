<<global_block>>
declare
emp_id    number(3);
begin
emp_id := 20;
<<jerry>>
declare
emp_dept       number(4) := 20;
emp_id         CHAR(5) := '0.1';
emp_name       varchar2(9) := 'John Duda';
emp_job        char(5) := 'SALES';
emp_years      number(4) :=10;
begin
insert into staff(id,name,job,years,dept)
values(global_block.emp_id,emp_name,emp_job,emp_years,emp_dept);
commit;
end jerry;
end global_block;
/
