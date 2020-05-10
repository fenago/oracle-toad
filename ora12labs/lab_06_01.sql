drop tablespace tbsspc including contents and datafiles;
CREATE SMALLFILE TABLESPACE "TBSSPC"
DATAFILE 'c:\oracle\tbsspc1.dbf' SIZE 50M
AUTOEXTEND ON NEXT 10M MAXSIZE 200M
LOGGING
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT MANUAL;
exec dbms_workload_repository.modify_snapshot_settings(interval =>1440);
exec dbms_advisor.set_default_task_parameter('ADDM','DB_ACTIVITY_MIN',30);
drop user spc cascade;
create user spc identified by spc
default tablespace tbsspc
temporary tablespace temp;
 grant connect, resource, dba to spc;
connect spc/spc
drop table spct purge;
create table spct(id number, name varchar2(2000));
exec DBMS_STATS.GATHER_TABLE_STATS('SPC','SPCT',estimate_percent=>DBMS_STATS.AUTO_SAMPLE_SIZE);
/
