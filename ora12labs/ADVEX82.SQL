SELECT DEPT, NAME, SALARY, JOB
FROM STAFF
WHERE JOB = 'MGR' AND DEPT IN
(SELECT DEPT
FROM STAFF
GROUP BY DEPT
HAVING AVG(SALARY) >
(SELECT AVG(SALARY) FROM STAFF))
/
