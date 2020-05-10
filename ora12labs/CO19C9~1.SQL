CREATE OR REPLACE TYPE BODY Room2Obj AS
 member procedure pRINT is
 BEGIN
  DBMS_OUTPUT.PUT('Room ID: ' || ID || ' is located in ' );
  DBMS_OUTPUT.PUT(building || ', room ' || room_number );
  DBMS_OUTPUT.PUT(', and has ' || number_seats || ' seats.');
  DBMS_OUTPUT.NEW_LINE;
END Print;
MAP MEMBER FUNCTION RETURNID RETURN NUMBER IS
BEGIN
    RETURN SELF.ID;
END ReturnID;
END;
/
