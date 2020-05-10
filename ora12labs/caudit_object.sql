select substr(username,1,12)                     USERNAME,
       substr(PRIV_USED,1,12)                    Privilege,
       substr(action_name,1,12)                  Action_name,
       substr(Obj_Name,1,9)                      Obj_Name,
       to_char(timestamp,'dd-mon-yy hh24:mi:ss') Timestamp,
       Returncode
from dba_audit_object
where username = upper('&a_user_name')
/
