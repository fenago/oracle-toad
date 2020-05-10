  MERGE INTO EMP e1
   using (select * from emp_old) e2
  on (e1.empno = e2.empno)
  WHEN MATCHED THEN
    UPDATE SET e1.sal = e2.sal
  WHEN NOT MATCHED THEN
    INSERT (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (E2.EMPNO, E2.ENAME, E2.JOB, E2.MGR, E2.HIREDATE,
            E2.SAL,E2.COMM,E2.DEPTNO)
/
