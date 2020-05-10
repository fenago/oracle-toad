DECLARE
Reginfo	aq$reg_info;
Reginfolist	aq$reg_info_list;
BEGIN
	Reginfo := AQ$_REG_INFO(‘ALERT_QUE;ALERT_USR1’,
	DBMS_AQ.NAMESPACE_AQ, ‘mailto://yourname@yourcompany.com’,NULL);
 Create the registration info list
Reginfolist  := AQ$_REG_INFO_LIST(reginfo);
      Register the registration info list
	DBMS_AQ.REGISTER(reginfolist,1);
      END;
      /
	--BEGIN
--DBMS_AQELM.SET_MAILHOST(‘yourmailhost.com’);
-- DBMS_AQELM.SET_MAILPORT(25);
-- DBMS_AQELM.SET_SENDFROM(‘janedoes@yourcompany.com’);
-- COMMIT;
-- END;

/
