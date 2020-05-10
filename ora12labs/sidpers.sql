set echo off
set termout off
set feedback off
set linesize 1000
set pagesize 0
set heading off
-- sidpers, svcmbr, unit
spool unit
select 'insert into pers_unit_tbl values (',p.*,')' from pers_unit_tbl p;
spool off