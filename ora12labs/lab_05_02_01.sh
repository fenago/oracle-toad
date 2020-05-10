
# connected as user oracle

export ORACLE_SID=orcl

sqlplus / as sysdba  << END

set echo on

drop tablespace tbsspc including contents and datafiles;

CREATE SMALLFILE TABLESPACE "TBSSPC"
DATAFILE 'tbsspc1.dbf' SIZE 50M
LOGGING
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT MANUAL;

execute dbms_workload_repository.modify_snapshot_settings(interval => 0);

drop user spc cascade;

create user spc identified by spc
default tablespace tbsspc
temporary tablespace temp;

grant connect, resource, dba to spc;

connect spc/spc

drop table spct purge;
create table spct(id number, name varchar2(2000));

exec DBMS_STATS.GATHER_TABLE_STATS(-
ownname=>'SPC', tabname=>'SPCT',-
estimate_percent=>DBMS_STATS.AUTO_SAMPLE_SIZE);

exit;
END
