
# Connected as user oracle

export ORACLE_SID=prod

emctl stop dbconsole

sqlplus -S / as sysdba << END

shutdown immediate;

exit;
END

export ORACLE_SID=orcl

rm /u01/app/oracle/product/10.2.0/db_1/rdbms/log/awrdat_1_141.dmp
cp $HOME/labs/awrdat_1_141.dmp /u01/app/oracle/product/10.2.0/db_1/rdbms/log/
cp $HOME/labs/awrloadjfv.sql /u01/app/oracle/product/10.2.0/db_1/rdbms/admin


emctl stop dbconsole


sqlplus -S / as sysdba @lab_04_02_02.sql

emctl start dbconsole
