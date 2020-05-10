column username format 'a10'
column osuser format 'a10'
column module format 'a16'
column program_name format 'a20'
column program format 'a20'
column machine format 'a20'
column action format 'a20'
column sid format '9999'
column serial# format '99999'
column spid format '99999'
set linesize 200
set pagesize 30
select
a.sid,a.serial#,a.username,a.osuser,c.start_time,
b.spid,a.status,a.machine,
a.action,a.module,a.program
from
v$session a, v$process b, v$transaction c,
v$sqlarea s
Where
a.paddr = b.addr
and a.saddr = c.ses_addr
and a.sql_address = s.address (+)
and to_date(c.start_time,'mm/dd/yy hh24:mi:ss') <= sysdate - (15/1440) -- running for 15 minutes
order by c.start_time
/
