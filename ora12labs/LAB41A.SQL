select dept,name,salary,DEPTNAME
  from staff,ORG
  where DEPT = DEPTNUMB AND (dept,salary) in
  (select dept, max(salary)
   from staff
   group by dept)
/
