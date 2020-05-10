SELECT ename "Employee", CONNECT_BY_ISCYCLE "Cycle",
   2 LEVEL, SYS_CONNECT_BY_PATH(ename, '/') "Path"
   3 FROM scott.emp
   4 WHERE level <= 3 AND deptno = 10
   5 START WITH ename = 'KING'
   6 CONNECT BY NOCYCLE PRIOR empno = mgr AND LEVEL <= 4;
/
