select substr(username,1,12)                     USERNAME,
       substr(os_USERNAME,1,12)                  OS_UserName,
       substr(Terminal,1,9)                      Terminal,
       substr(Action_Name,1,12)                  Action,
       to_char(timestamp,'dd-mon-yy hh24:mi:ss') Timestamp,
       Returncode
from dba_audit_session 
/
