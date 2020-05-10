-- sol_04_01_04.sql n
-- execute in answer step 3
set echo on
col reason format a75
SELECT reason FROM DBA_OUTSTANDING_ALERTS;
SELECT TO_CHAR(begin_time,'hh24:mi:ss'),
dbtime_in_wait,average_waiter_count
FROM V$WAITCLASSMETRIC_HISTORY
WHERE wait_class#=4 
AND  wait_class_id=3875070507
AND  begin_time > SYSDATE-(10/1440);
-- Cleared!
SELECT reason,resolution
FROM DBA_ALERT_HISTORY
WHERE reason like 
'%Database Time Spent Waiting (%)%Concurrency%' 
 AND TO_DATE(SUBSTR(TO_CHAR(creation_time),1,18)||
        SUBSTR(TO_CHAR(creation_time),26,3)  ,        'DD-MON-YY HH:MI:SS AM') > SYSDATE-(10/1440)
ORDER BY creation_time DESC;
EXIT;
