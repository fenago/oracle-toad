
# connected as user oracle

export ORACLE_SID=orcl

sqlplus / as sysdba << END
set echo on

exec DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT();

exit;
END
