--**************************************************************
--   get_sql.sql
--
--   © 2002 by Jerry Richard
--
--   No part of this SQL script may be copied. Sold or distributed
--   without the express consent of Jerry Richard
--**************************************************************
set lines 2000;

select
   sql_text,
   disk_reads,
   executions,
   parse_calls
from
   v$sqlarea
where
   lower(sql_text) like '% staff %'
--and
   --executions > 100
order by
   disk_reads desc
;
