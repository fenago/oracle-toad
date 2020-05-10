DECLARE
Reginfo	        aq$_reg_info;
Reginfolist	aq$_reg_info_list;
BEGIN
	Reginfo := AQ$_REG_INFO('ALERT_QUE;ALERT_USR1',
	DBMS_AQ.NAMESPACE_AQ, 'mailto://richardjerrye@hotmail.com',NULL);
-- Create the registration info list
Reginfolist  := AQ$_REG_INFO_LIST(reginfo);
--Register the registration info list
	DBMS_AQ.REGISTER(reginfolist,1);
      END;
/
