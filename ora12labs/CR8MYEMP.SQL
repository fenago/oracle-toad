create table myemp (
ID    NUMBER(4) NOT NULL,
 NAME  VARCHAR2(20),
 DEPT  NUMBER(4),
 YEARS  NUMBER(4),
 SALARY Sal_ACCUM)
NESTED TABLE SALARY STORE AS SALARY_TAB
/
