SELECT ename "Employee", CONNECT_BY_ROOT empno "Root", LEVEL,
  SYS_CONNECT_BY_PATH(ename,'/')  "Path" FROM scott.emp
  WHERE level <= 3 AND deptno = 10 START WITH ename='KING'
  CONNECT BY NOCYCLE PRIOR empno = mgr AND LEVEL <= 4
/
