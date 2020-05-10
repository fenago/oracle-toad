BEGIN
DBMS_SERVER_ALERT.set_threshold( dbms_server.user_commits_sec,
          Dbms_server_alert.operator_ge, 3,  Dbms_server_alert.operator_ge, 3,1,2,'ORA10G',
           Dbms_server_alert.object_type_system,null);
END;
/
