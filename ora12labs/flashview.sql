create view emp_created_today as
as select * from emp
minus
select * from emp as of timestamp trunc(sysdate)
/
