SELECT ID,NAME,JOB,SALARY,DEPT,DIVISION
FROM STAFF,ORG
WHERE SALARY BETWEEN 15000 AND 30000 AND
DEPT = DEPTNUMB
ORDER BY DIVISION,JOB
/
