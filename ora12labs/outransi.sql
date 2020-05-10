select name,deptname,salary
from staff left outer join org
on dept=deptnumb 
where (dept not in
(select deptnumb from org) or dept is null)
/
