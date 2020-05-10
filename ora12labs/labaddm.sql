	exec DBMS_AQADM.ADD_SUBSCRIBER(‘SYS.ALERT_QUE’,-
AQ$_AGENT(‘ALERT_USR1’,’’,0));
	exec DBMS_AQADM.CREATE_AQ_AGENT(agent_name=>’ALERT_USR1);  
	exec DBMS_AQADM.ENABLE_DB_ACCES(agent_name=>’ALERT_USR1’,-
db_username=>’SYSTEM’);
	exec DBMS_AQADM.GRANT_QUEUE_PRIVILEGE(privilege=>’DEQUEUE’,-queue_name=>’ALERT_QUE’,grantee=>’SYSTEM’,grant_option=FALSE);
	DECLARE
Reginfo	aq$reg_info;
Reginfolist	aq$reg_info_list;
BEGIN
	Reginfo := AQ$_REG_INFO(‘ALERT_QUE;ALERT_USR1’,
	DBMS_AQ.NAMESPACE_AQ, ‘mailto://yourname@yourcompany.com’,NULL);
-- Create the registration info list
Reginfolist  := AQ$_REG_INFO_LIST(reginfo);
      --Register the registration info list
	DBMS_AQ.REGISTER(reginfolist,1);
      END;
/
