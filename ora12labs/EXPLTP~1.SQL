PACKAGE get_user_details
As
 	FUNCTION osuser RETURN VARCHAR2;
END;
PACKAGE BODY get_user_details
AS
	Xosuser   VARCHAR2(30);
	FUNCTION osuser RETURN VARCHAR2 AS
	CURSOR C1 IS
	SELECT	 v.osuser
	FROM 	v$session v
	WHERE  	v.audsid = userenv(‘SESSIONID’);
BEGIN
	If xosuser is NOT NULL then
	OPEN C1;
	FETCH C1 INTO xosuser;
	CLOSE C1;
	END IF;
	RETURN (xosuser);
END;
END;
/
 :osuser := get_user_details.osuser;

/
