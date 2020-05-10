-- lab_04_01_02.sql

set echo on

variable wo number
variable wv varchar2(10)
variable co number
variable cv varchar2(10)
variable op number
variable ct number

BEGIN
DBMS_SERVER_ALERT.get_threshold(
     metrics_id => dbms_server_alert.DB_TIME_WAITING,
     warning_operator        => :wo,
     warning_value           => :wv,
     critical_operator       => :co,
     critical_value          => :cv,
     observation_period      => :op,
     consecutive_occurrences => :ct,
     instance_name           => 'orcl',
     object_type =>
           dbms_server_alert.OBJECT_TYPE_EVENT_CLASS,
     object_name             => 'Concurrency');
END;
/

print  wv 

col object_name format a20
col metrics_name format a25
col warning_value format a10
col critical_value format a10

select object_name,warning_value,critical_value
from dba_thresholds
where metrics_name='Database Time Spent Waiting (%)';

exit;

