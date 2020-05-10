Select reason from dba_alert_history
  Where upper(reason) like '%COMMIT%' and
To_date(substr(to_char(creation_time),1,18) ||
             Substr(to_char(creation_time),26,3) ,
             'DD-MON-YY HH:MI:SS AM') > sysdate-30/1440
  Order by creation_time desC
/
