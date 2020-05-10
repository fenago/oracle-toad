select dept,avg(salary),avg(years)
from staff
group by dept
having avg(salary) > 18000
/
