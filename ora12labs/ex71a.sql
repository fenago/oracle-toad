select deptnumb,
       deptname,
       name,
       salary
from staff join org
on manager=id
/
