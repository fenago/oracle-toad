SELECT TO_CHAR(begin_time,'hh24:mi:ss'),
 dbtime_in_wait,average_waiter_count
 FROM V$WAITCLASSMETRIC_HISTORY
 WHERE wait_class#=4
 AND wait_class_id=3875070507
 AND begin_time > SYSDATE-(10/1440);
/
