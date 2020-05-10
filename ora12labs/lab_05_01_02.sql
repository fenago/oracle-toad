--lab_05_01_02.sql
 variable wo number
 variable wv varchar2(10)
  variable co number
 variable cv varchar2(10)
 variable op number
 variable ct number

 BEGIN
DBMS_SERVER_ALERT.get_threshold(
 metrics_id => dbms_server_alert.DB_TIME_WAITING,
 warning_operator => :wo,
 warning_value => :wv,
 critical_operator => :co,
 critical_value => :cv,
 observation_period => :op,
 consecutive_occurrences => :ct,
 instance_name => 'orcl',
 object_type =>
 dbms_server_alert.OBJECT_TYPE_EVENT_CLASS,
 object_name => 'Concurrency');
 END;
 /
