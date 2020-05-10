-- lab_04_01_03.sql
-- executed in answer step 1

set echo on

BEGIN
   DBMS_SERVER_ALERT.set_threshold(
   metrics_id => dbms_server_alert.DB_TIME_WAITING,
   warning_operator => dbms_server_alert.OPERATOR_GE,
   warning_value    => 60,
   critical_operator=> dbms_server_alert.OPERATOR_GE,
   critical_value   => 90,
   observation_period=> 1,
   consecutive_occurrences => 1,
   instance_name    => 'orcl',
   object_type      =>
        dbms_server_alert.OBJECT_TYPE_EVENT_CLASS,
   object_name      => 'Concurrency');
   END;
/

col object_name format a20
col metrics_name format a25
col warning_value format a10
col critical_value format a10

select object_name,warning_value,critical_value 
from dba_thresholds
where metrics_name=
       'Database Time Spent Waiting (%)';

exit;
