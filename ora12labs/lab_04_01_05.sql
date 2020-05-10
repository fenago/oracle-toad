-- lab_04_01_05.sql 

set echo on

DROP USER jfv CASCADE;

DROP TABLESPACE tbsjfv INCLUDING CONTENTS AND DATAFILES;

BEGIN
DBMS_SERVER_ALERT.set_threshold(
   metrics_id => dbms_server_alert.DB_TIME_WAITING,
   warning_operator => dbms_server_alert.OPERATOR_GE,
   warning_value => 30,
   critical_operator => NULL,
   critical_value => NULL,
   observation_period => 1,
   consecutive_occurrences => 1,
   instance_name => 'orcl',
   object_type => 
       dbms_server_alert.OBJECT_TYPE_EVENT_CLASS,
   object_name => 'Concurrency');
END;
/

EXIT;
