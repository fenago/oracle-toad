
set echo off

drop user jfv cascade;

create user jfv identified by jfv
default tablespace users
temporary tablespace temp;

grant connect,resource,dba to jfv;

connect jfv/jfv
 
set echo off

drop table work purge;

create table work(c number);

connect / as sysdba

set echo off

ALTER SYSTEM CHECKPOINT;

shutdown abort;
-- set SGA_TARGET to 400M
!cp $HOME/labs/spfile_04_02.ora $ORACLE_HOME/dbs/spfileorcl.ora

startup

begin
  dbms_workload_repository.modify_snapshot_settings(retention => 0,interval => 0);
end;
/ 


-- Make sure there is no preserved snapshot sets!!
DECLARE
 databid number;
 snapnb  number;
BEGIN
 select dbid into databid from v$database;
 select count(*) into snapnb from wrm$_snapshot;
 DBMS_WORKLOAD_REPOSITORY.DROP_SNAPSHOT_RANGE(1,500,databid);
END;
/


-- Make sure that your SGA_TARGET is set to greater than 272M!!
@/u01/app/oracle/product/10.2.0/db_1/rdbms/admin/awrloadjfv.sql



BEGIN
 execute immediate 'ALTER TABLE WRM$_SNAPSHOT DISABLE CONSTRAINT WRM$_SNAPSHOT_FK';
 for s in (select table_name from user_tables where table_name like 'WRH$%' or table_name like 'WRM$%') loop
   execute immediate 'DELETE '||s.table_name;
 end loop;
 execute immediate 'ALTER TABLE WRM$_SNAPSHOT ENABLE CONSTRAINT WRM$_SNAPSHOT_FK';
END;
/

BEGIN
 dbms_swrf_internal.move_to_awr('JFV');
END;
/

DECLARE
 db_id number;
BEGIN
 select dbid into db_id from v$database;
 execute immediate 'ALTER TABLE WRM$_SNAPSHOT DISABLE CONSTRAINT WRM$_SNAPSHOT_FK';
 for s in (select table_name from user_tables where table_name like 'WRH$%' or table_name like 'WRM$%') loop
   execute immediate 'UPDATE '||s.table_name||' SET DBID='||db_id;
 end loop;
 execute immediate 'ALTER TABLE WRM$_SNAPSHOT ENABLE CONSTRAINT WRM$_SNAPSHOT_FK';
END;
/


-- begin
--  dbms_workload_repository.modify_snapshot_settings(retention => 28800,    
--                            interval => 60);
-- end;
-- / 

exit;

