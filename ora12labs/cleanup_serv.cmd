sqlplus / as sysdba 
set echo on
EXEC DBMS_SERVICE.STOP_SERVICE('SERV1');
EXEC DBMS_SERVICE.DELETE_SERVICE('SERV1');
exit;
copy old_tnsnames.ora c:\oracle\product\10.2.0\db_1\network\admin\tnsnames.ora
