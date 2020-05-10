-- lab_04_01_01.sql 

--  connected as user oracle
-- with the following environment variables

-- export ORACLE_SID=orcl

-- sqlplus / as sysdba 

set echo on

drop tablespace tbsjfv including contents and datafiles;

CREATE SMALLFILE TABLESPACE "TBSJFV"
DATAFILE 'tbsjfv1.dbf' SIZE 50M
AUTOEXTEND ON NEXT 10M MAXSIZE 200M
LOGGING
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT MANUAL;

execute dbms_workload_repository.modify_snapshot_settings(interval => 0);

drop user jfv cascade;

create user jfv identified by jfv
default tablespace tbsjfv
temporary tablespace temp;

grant connect, resource, dba to jfv;

connect jfv/jfv

drop table jfvt purge;
create table jfvt(id number, name varchar2(2000)) ;

exec DBMS_STATS.GATHER_TABLE_STATS(-
ownname=>'JFV', tabname=>'JFVT',-
estimate_percent=>DBMS_STATS.AUTO_SAMPLE_SIZE);

BEGIN
DBMS_SERVER_ALERT.set_threshold(
   metrics_id => dbms_server_alert.DB_TIME_WAITING,
   warning_operator => dbms_server_alert.OPERATOR_GE,
   warning_value => 30,
   critical_operator => NULL,
   critical_value => NULL,
   observation_period => 1,
   consecutive_occurrences => 1,
   instance_name => 'orcl',
   object_type => 
       dbms_server_alert.OBJECT_TYPE_EVENT_CLASS,
   object_name => 'Concurrency');
END;
/

exit;
