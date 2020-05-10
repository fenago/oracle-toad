DECLARE
 TYPE c_BookList IS VARRAY(25) OF BookObj;
 TYPE t_Numbers  IS VARRAY(10) OF NUMBER(3) NOT NULL;
 TYPE t_Students IS VARRAY(100) OF Students%ROWTYPE;
begin

DECLARE
 /* Declare a NULL array   */
 v_NullList    t_Numbers;

 /* This array has two (2) elements  */
 v_List1   t_Numbers := t_Numbers(1,2);

 /*  This array has one element, which itself is NULL  */
 v_List2   t_Numbers  := t_Numbers();

BEGIN
 IF  v_NullList IS NULL then
  DBMS_OUTPUT.PUT_LINE('v_NullList IS NULL');
 END IF;

 /*IF v_List2(1)  IS NULL then
  DBMS_OUTPUT.PUT_LINE('v_List2 IS NULL');
 END IF; */
END;
END;
/
