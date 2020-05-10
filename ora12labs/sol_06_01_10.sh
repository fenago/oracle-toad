
# connected as user oracle

export ORACLE_SID=orcl

sqlplus / as sysdba << END
set echo on

@?/rdbms/admin/ashrpt

exit;
END
