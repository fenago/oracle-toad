INSERT INTO STAFF (ID,NAME,JOB,SALARY)
SELECT TEMPID,NAME,'MGR',60000.00 FROM APPLICANT
WHERE TEMPID = 777
/
