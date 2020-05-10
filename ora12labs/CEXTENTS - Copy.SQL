select segment_name,sum(bytes),sum(blocks),count(*)
from user_extents
where segment_name = upper('&tablename')
group by segment_name
/
