SELECT reason,resolution
 FROM DBA_ALERT_HISTORY
 WHERE reason like
 '%Database Time Spent Waiting (%)%Concurrency%'
 AND TO_DATE(SUBSTR(TO_CHAR(creation_time),1,18)||
 SUBSTR(TO_CHAR(creation_time),26,3) ,
 'DD-MON-YY HH:MI:SS AM') > SYSDATE-(10/1440)
 ORDER BY creation_time DESC
/
