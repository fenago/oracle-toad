declare
  TYPE t_BookList  IS VARRAY(25) OF BookObj;
  TYPE t_Numbers IS VARRAY(10) of NUMBER(3);
  TYPE t_Students IS VARRAY(100) of students%ROWTYPE;

  v_NullList   t_Numbers;
  v_List1      t_Numbers := t_Numbers(1,2);
  -- Varray has one element, which itself is NULL.
  v_List2      t_Numbers := t_Numbers(NULL);
  BEGIN
  if V_nULLlIST is NULL then
    DBmS_OUTPUT.PUT_LINE('v_NullList is NULL');
  END IF;
  IF v_List2(1) IS NULL THEN
   DBMS_OUTPUT.PUT_LINE('v_List2(1) is NULL');
  END IF;
END;
/
