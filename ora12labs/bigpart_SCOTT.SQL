
BEGIN
  FOR I IN 3000001..6000000 LOOP
      IF I BETWEEN 1 AND 4000000 THEN
         INSERT INTO scott.BIG VALUES(I,'4 MILLION','TEST UP TO 2000',I+I);
      ELSIF I BETWEEN 4000001 AND 5000000 THEN
         INSERT INTO SCOTT.BIG VALUES(I,'BET 2K AND 5K','TEST UP TO 5000',I+I);
      ELSE
         INSERT INTO SCOTT.BIG VALUES(I,NULL,'TEST UP TO 100000',I+I);
      END IF;
      IF MOD(I,1000) = 0 THEN COMMIT;
      END IF;
  END LOOP;
END;
/




BEGIN
  FOR I IN 3000001..6000000 LOOP
      IF I BETWEEN 1 AND 4000000 THEN
         INSERT INTO SCOTT.BIGpart VALUES(I,'ONE THOUSAND','TEST UP TO 2000',I+I,sysdate);
      ELSIF I BETWEEN 4000001 AND 5000000 THEN
         INSERT INTO SCOTT.BIGpart VALUES(I,'BET 4M AND 5M','TEST UP TO 5000',I+I,sysdate);
      ELSE
         INSERT INTO SCOTT.BIGpart VALUES(I,NULL,'TEST UP TO 6000000',I+I,sysdate);
      END IF;
      IF MOD(I,1000) = 0 THEN COMMIT;
      END IF;
  END LOOP;
END;
/
set feedback off
set termout off
select b1.bigno, b2.bname,b3.bcomments
from SCOTT.big b1, SCOTT.big2 b2, SCOTT.bigpart b3
where b1.bigno = b2.bigno 
and b1.bigno = b3.bigno 
and b1.bname = b3.bname
and b3.bcomments like '%TEST%';
select b1.bigno, b2.bname,b2.b2comments,b3.bcomments,b3.binteger
from SCOTT.big b1, SCOTT.big2 b2, SCOTT.bigpart b3
where b1.bigno > b2.bigno 
and b1.bigno = b3.bigno 
and b1.bname = b3.bname
and b3.bcomments like '%TEST%' and b1.binteger between 5000 and 900000;
select b1.bigno, b2.bname,b2.b2comments,b3.bcomments,b3.binteger
from SCOTT.big b1, SCOTT.big2 b2, SCOTT.bigpart b3
where b1.bigno = b2.bigno 
and b1.bigno = b3.bigno 
and b3.bname <> b1.bname
and b3.bcomments like '%TEST%' and b1.binteger between 5000 and 2000000;
@demobld
set feedback on
set termout on

