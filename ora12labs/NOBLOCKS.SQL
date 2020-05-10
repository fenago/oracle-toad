select substr(segment_name,1,20),SUM(bytes),sum(extents),SUM(blocks) "TOTAL BLOCKS"
from dba_segments  WHERE SEGMENT_NAME = upper('&tablename')
GROUP BY SUBSTR(SEGMENT_NAME,1,20)
/
