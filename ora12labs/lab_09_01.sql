DROP TABLE EXP_TEST PURGE;
Create table exp_test ( id Number(6,0),
 pad varchar2 (20),
Cid VARCHAR(20),
 Nid NUMBER(6,0));
Begin
FOR i in 1..1000 LOOP
INSERT INTO exp_test values(
 i, 'X', TO_CHAR(i), i*100+6);
 END LOOP;
 END;
/
