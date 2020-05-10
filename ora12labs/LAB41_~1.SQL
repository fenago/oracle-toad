select s1.dept,s1.name,s1.salary, maxsal
from staff s1, (select dept, max(salary) maxsal from staff
                  group by dept) newstaff
where s1.dept = newstaff.dept and s1.salary = maxsal
/
