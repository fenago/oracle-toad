select name,status,circuit,idle,busy,requests
,to_char(sysdate,'HH:MI:SS')
from V$SHARED_SERVER
/
