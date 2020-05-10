select dept, job, max(salary), max(comm)
from staff
group by dept,job