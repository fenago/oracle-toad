select name, dept, job, salary from staff where (dept, salary) IN
(select dept, max(salary) from staff group by dept )
/
