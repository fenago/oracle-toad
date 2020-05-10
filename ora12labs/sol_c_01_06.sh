
sqlplus / as sysdba <<END
exec DBMS_SERVER_ALERT.SET_THRESHOLD(-
dbms_server_alert.elapsed_time_per_call,-
dbms_server_alert.OPERATOR_GE,40000000,dbms_server_alert.OPERATOR_GE,100000000,1,1,'orcl',-
dbms_server_alert.object_type_service,'SERV1');
exit
END
