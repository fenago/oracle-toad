select dept, sum(comm)
from staff
group by dept
having sum(comm) >= 1200
/
