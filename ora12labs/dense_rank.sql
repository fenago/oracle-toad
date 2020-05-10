SELECT empno, deptno, sal,
RANK() OVER (PARTITION BY deptno
ORDER BY sal DESC NULLS LAST) RANK,
DENSE_RANK() OVER (PARTITION BY
deptno ORDER BY sal DESC NULLS
LAST) DENSE_RANK
FROM emp
WHERE deptno IN (10, 20)
ORDER BY 2, RANK
/