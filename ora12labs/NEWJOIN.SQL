select dept, name, salary, deptname,location
  from staff left outer join org
  on dept = deptnumb
/
