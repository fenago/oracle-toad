sqlplus / as sysdba 
set termout on
set echo on
drop user jfv cascade;
create user jfv identified by jfv
default tablespace users
temporary tablespace temp;
grant connect, resource, dba to jfv;
connect jfv/jfv
select count(*) from dba_objects,dba_objects,dba_objects;
exit;
