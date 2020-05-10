select substr(segment_name,1,20),bytes,bytes/10240 "NO OF EXTENTS" ,blocks ,sysdate
from dba_extents
/
