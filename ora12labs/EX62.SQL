select dept,min(years)
from staff
group by dept
having min(years) >=5
/
