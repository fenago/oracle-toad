-- sol_03_02_03.sql

COLUMN event FORMAT A30

SELECT event, total_waits, time_waited, average_wait
 FROM V$SYSTEM_EVENT
 ORDER BY time_waited DESC;

