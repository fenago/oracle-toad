# connected as user oracle
set ORACLE_SID=orcl
sqlplus / as sysdba 
set echo on
@c:\oracle\product\10.2.0\db_1\rdbms\admin\ashrpt
exit;
END
