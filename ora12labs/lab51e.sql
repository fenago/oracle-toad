begin
DBMS_AQADM.GRANT_QUEUE_PRIVILEGE(privilege=>'DEQUEUE',queue_name=>'ALERT_QUE',grantee=>'SYSTEM');
end;
/
