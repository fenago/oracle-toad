select command_type,substr(sql_text,1,50) TEXT, executions
from V$SQLAREA
where executions > 4000
order by 3
/
