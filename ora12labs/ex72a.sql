select s.name,s.salary,'emp salary >',
       m.salary,m.name,m.dept
from staff s join staff m
on m.dept=s.dept 
where m.job='MGR' and s.salary>m.salary
/
