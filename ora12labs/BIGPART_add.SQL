BEGIN
  FOR I IN 18000001..21000000 LOOP
      IF I BETWEEN 18000001 AND 190000000 THEN
         INSERT INTO scott.BIG VALUES(I,'4 MILLION','TEST UP TO 2000',I+I);
      ELSIF I BETWEEN 19000001 AND 20000000 THEN
         INSERT INTO SCOTT.BIG VALUES(I,'BET 2K AND 5K','TEST UP TO 5000',I+I);
      ELSE
         INSERT INTO SCOTT.BIG VALUES(I,NULL,'TEST UP TO 100000',I+I);
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

