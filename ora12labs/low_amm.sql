conn sys/password as sysdba;
alter system set memory_max_target=400m scope=spfile;
alter system set memory_target=300m scope=spfile;
alter system set sga_max_size=180m scope=spfile;
shutdown immediate;
startup;
set termout off
set echo off
set feedback off
conn scott/tiger
grant select on scott.big to hr;
grant select on scott.big2 to hr;
grant select on scott.bigpart to hr;
set termout off
@select_io