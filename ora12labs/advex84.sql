SELECT ID,NAME,SALARY,COMM FROM STAFF
WHERE SALARY > 20000 AND EXISTS
(SELECT * FROM STAFF
WHERE COMM < 350)
/
