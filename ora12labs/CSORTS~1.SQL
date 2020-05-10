select name,value
from V$sysstat
where name like '%sort%'
/
