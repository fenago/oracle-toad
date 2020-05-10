CREATE OR REPLACE PROCEDURE YEARS_EMP
(ID IN NUMBER,DOB OUT NUMBER)
AS
BEGIN
SELECT  ROUND((SYSDATE - HIREDATE)/365) 
INTO DOB FROM EMP
WHERE EMPNO = ID;
END YEARS_EMP;
/