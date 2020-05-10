# connected as user oracle
set ORACLE_SID=orcl
sqlplus / as sysdba 
set echo on
exec DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT();
exit;
END
