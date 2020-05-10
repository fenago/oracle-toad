#!/bin/bash
x=`hostname`
echo $x

sqlplus / as sysdba << FIN

set echo on

EXEC DBMS_SERVICE.STOP_SERVICE('SERV1');

EXEC DBMS_SERVICE.DELETE_SERVICE('SERV1');

exit;
FIN

cp old_tnsnames.ora $ORACLE_HOME/network/admin/tnsnames.ora
