SELECT COUNT(*) as TOTAL,
      SUM (CASE WHEN DEPTNO = 10 THEN 1 ELSE 0 END) AS COUNT_10,
      SUM (CASE WHEN DEPTNO = 20 THEN 1 ELSE 0 END) AS COUNT_20,
      SUM (CASE WHEN DEPTNO = 30 THEN 1 ELSE 0 END) AS COUNT_30,
      SUM (CASE WHEN DEPTNO = 40 THEN 1 ELSE 0 END) AS COUNT_40
FROM EMP
/
