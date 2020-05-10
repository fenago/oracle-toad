DECLARE
  v_Test   ErrorObj := ErrorObj(1);
  v_NumVal  NUMBER := 10;
 BEGIN
  v_Test.Print('After initialization, v_NumVal = ' || v_NumVal);
  v_Test.RaiseError(False,v_NumVal);
  v_Test.Print('After call with no exception, v_NumBal = '|| v_NumVal);
  v_Test.RaiseError(True,v_NumVal);
EXCEPTION
 WHEN NO_DATA_FOUND THEN
  v_Test.Print('After call with exception, v_NumVal = '|| v_NumVal);
END;
/
