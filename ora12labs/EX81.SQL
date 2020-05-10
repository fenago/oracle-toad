select name,job,dept
from staff
where job='MGR' and dept in
(select deptnumb from org
where division = 'MIDWEST')
/
