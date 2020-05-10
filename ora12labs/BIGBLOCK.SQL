select substr(segment_name,1,20),SUM(bytes),SUM(bytes/51200) "NO OF EXTENTS" ,SUM(blocks) "TOTAL BLOCKS"
from dba_extents  WHERE SEGMENT_NAME = 'BIG'
GROUP BY SUBSTR(SEGMENT_NAME,1,20)
/
