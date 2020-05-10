DECLARE
  -- Obtain SCN prior to the DML operation
 a_scn_no number := DBMS_FLASHBACK.GET_SYSTEM_CHANGE_NUMBER;
  -- Define a cursor to store data retrieved from past
  cursor c_emp is SELECT * FROM EMP;
  c_emp_rec    c_emp%ROWTYPE;
BEGIN
--- Perform the DML operation
  UPDATE EMP
    SET SAL = SAL * 1.15;
    -- Standard Peoplesoft salary increase
   DELETE FROM EMP WHERE SAL > 4000.00;
  COMMIT;
  -- These updates and deletes are erroneous and we need to recov
  -- the data. Enable Flashback query based upon SCN.
  DBMS_FLASHBACK.ENABLE_AT_SYSTEM_CHANGE_NUMBER(a_scn_no);

/
