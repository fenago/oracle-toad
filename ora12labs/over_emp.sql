SELECT empno, deptno,
COUNT(*) OVER (PARTITION BY
deptno) DEPT_COUNT
FROM emp
WHERE deptno IN (20, 30)
/
