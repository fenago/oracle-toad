select tablespace_name,
sum(bytes),
max(bytes),
count(*)
from dba_free_space
group by tablespace_name
/
