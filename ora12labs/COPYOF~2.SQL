CREATE OR REPLACE TYPE BODY ErrorObj AS
MEMBER PROCEDURE RaiseError(p_RaiseIt IN BOOLEAN,
                           p_OutParam IN OUT NUMBER) IS
BEGIN
 SELF.ATTRIBUTE := p_outParam;
 p_OutParam := p_OutParam + 1;
 IF p_RaiseIt THEN
  RAISE NO_DATA_FOUND;
 END IF;
END RaiseError;

 MEMBER PROCEDURE Print (p_Comment IN VARCHAR2 DEFAULT NULL) IS
 BEGIN
  IF p_Comment IS NOT NULL THEN
   DBMS_OUTPUT.PUT(p_Comment || ', ');
  END IF;
  DBMS_OUTPUT.PUT_LINE('attribute = ' || attribute);
 END Print;
END;
/
