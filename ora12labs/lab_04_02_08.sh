
# Connected as user oracle

export ORACLE_SID=orcl

cp $HOME/labs/catawr.sql $ORACLE_HOME/rdbms/admin

cp $HOME/labs/catnoawr.sql $ORACLE_HOME/rdbms/admin

emctl stop dbconsole

sqlplus / as sysdba << FIN

set echo on

begin
  dbms_workload_repository.modify_snapshot_settings(retention => 0,interval => 0);
end;
/ 

drop user jfv cascade;

set echo off
set feedback off

@$ORACLE_HOME/rdbms/admin/catnoawr.sql

@$ORACLE_HOME/rdbms/admin/catawr.sql

set echo on
set feedback on

shutdown immediate;

startup;

begin
  dbms_workload_repository.modify_snapshot_settings(retention => 28800,interval => 60);
end;
/ 

exec DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT();

exit;
FIN

emctl start dbconsole


export ORACLE_SID=prod

sqlplus / as sysdba << END

startup;

exit;
END

emctl start dbconsole
