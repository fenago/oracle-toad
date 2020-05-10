set numwidth 11
set linesize 132
set pagesize 200
column salary format $999,999.99
column comm format $99,999.99
define gname = 'connected'
column global_name new_value gname
set termout off
SELECT
user || ' (' ||  v$instance.instance_name || ')'  global_name
FROM
v$instance, global_name;
set termout on
set sqlprompt '&&gname >'
set termout on
COLUMN TABLE_NAME FORMAT A15
column file_name format a65
column tablespace_name format a20
column name format a55
set feedback on
set serveroutput on

