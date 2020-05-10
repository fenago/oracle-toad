select name,deptname,salary
from staff,org
where dept=deptnumb(+) and (dept not in
(select deptnumb from org) or dept is null)
/
