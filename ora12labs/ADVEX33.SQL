SELECT DEPT, SUM(COMM)  FROM STAFF GROUP BY DEPT
HAVING SUM(COMM) >= 1200.00
/
