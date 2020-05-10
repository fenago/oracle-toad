CREATE TABLE EMP_OLD
AS SELECT * FROM EMP
WHERE EMPNO < 0;
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
  -- These updates and deletes are erroneous and we need to recover
  -- the data. Enable Flashback query based upon SCN.
  DBMS_FLASHBACK.ENABLE_AT_SYSTEM_CHANGE_NUMBER(a_scn_no);
 -- Now we are seeing an older version of the database
  -- Open cursor with FLASHBACK enabled to retrieve the data in the past
  OPEN c_emp;
-- Disable flashback after data retrieved
  DBMS_FLASHBACK.DISABLE;
 -- Now we come bak to the current version of the database
  -- Populate the emp_old table
  LOOP
  Fetch c_emp into c_emp_rec ;
  EXIT when c_emp%NOTFOUND;
   insert into emp_old (empno, ename, job, mgr, hiredate, sal,
                        comm, deptno)
    values (c_emp_rec.empno, c_emp_rec.ename, c_emp_rec.job,
            c_emp_rec.mgr, c_emp_rec.hiredate, c_emp_rec.sal,
            c_emp_rec.comm, c_emp_rec.deptno);
  end LOOP;
  CLOSE C_EMP;
  COMMIT;
-- RESTORE original salary information and deleted records to emp table
  MERGE INTO EMP e1
   using (select * from emp_old) e2
  on (e1.empno = e2.empno)
  WHEN MATCHED THEN
    UPDATE SET e1.sal = e2.sal
  WHEN NOT MATCHED THEN
    INSERT (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (E2.EMPNO, E2.ENAME, E2.JOB, E2.MGR, E2.HIREDATE,
            E2.SAL,E2.COMM,E2.DEPTNO);
  COMMIT;
END;
/
