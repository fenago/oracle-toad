select table_name,
       index_name,
       tablespace_name,
       ini_trans,
       leaf_blocks
from ALL_indexes
where table_name = upper('&tablename')
/
