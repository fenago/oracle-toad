select job, max(salary) "Maximum",Min(salary) "Minimum", Sum(Salary) "Sum", Round(Avg(salary),2) "Average"
from staff
group by job

