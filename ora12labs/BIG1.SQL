connect system/password
CREATE TABLESPACE JERRY
DATAFILE '/oracle/JERDATA.DBF' SIZE 50M;
connect scott/tiger@orcl;
DROP   TABLE        BIG;
CREATE TABLE        BIG
       (BIGNO       NUMBER(9),
        BNAME       VARCHAR2(20),
        bcomments   varchar2(50),
        binteger    number(9)
        ) tablespace jerry;
BEGIN
  FOR I IN 1..3000000 LOOP
      IF I BETWEEN 1 AND 2000 THEN
         INSERT INTO BIG VALUES(I,'ONE THOUSAND','TEST UP TO 2000',I+I);
      ELSIF I BETWEEN 2001 AND 5000 THEN
         INSERT INTO BIG VALUES(I,'BET 2K AND 5K','TEST UP TO 5000',I+I);
      ELSE
         INSERT INTO BIG VALUES(I,NULL,'TEST UP TO 1000000',I+I);
      END IF;
      IF MOD(I,1000) = 0 THEN COMMIT;
      END IF;
  END LOOP;
END;
/
--CREATE  PUBLIC SYNONYM BIG FOR BIG;

