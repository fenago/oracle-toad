set linesize 100
column error format a10
column recover format a10
column tablespace_name format a10
column name format a30
select file#, status, error, recover, tablespace_name, name
from v$datafile_header
/
