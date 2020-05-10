Connect as SYSDBA
Select reason from dba_outstanding_alerts;
Select reason
From dba_alert_history 
 Where upper(reason) like ‘%COMMIT%’ and
            To_date(substr(to_char(creation_time),1,18) ||
             Substr(to_char(creation_time),26,3) ,
             ‘DD-MON-YY HH:MI:SS AM’) > sysdate-30/1440
  Order by creation_time desc;
Execute the following script:
Connect as sysdba 
Drop table t purge;
Create table t(c number) tablespace users;
Insert into t values (1);
Commit;
Connect / as sysdba 
-- Should take around 1 minute
Begin
  For I in 1..60 loop
       For j in 1..6 loop
         Update t set c=2;
         Commit;
       End loop;
     Dbms_lock.sleep(1);
  End loop;
End;
     /
