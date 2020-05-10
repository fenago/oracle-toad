
BEGIN
  FOR I IN 1000001..3000000 LOOP
      IF I BETWEEN 1 AND 2000000 THEN
         INSERT INTO SPC.spcT VALUES(I,'UP TO 2 MILLION');
      ELSIF I BETWEEN 2000001 AND 3000000 THEN
         INSERT INTO SPC.SPCT VALUES(I,'BET 2K AND 5K');
      END IF;
      IF MOD(I,1000) = 0 THEN COMMIT;
      END IF;
  END LOOP;
END;
/





set feedback off
set termout off
select * FROM SPC.SPCT;
select b1.bigno, b2.bname,b2.b2comments,b3.bcomments,b3.binteger,spc.name
from SCOTT.big b1, SCOTT.big2 b2, SCOTT.bigpart b3
where b1.bigno > b2.bigno 
and b1.bigno = b3.bigno 
and b1.bname = b3.bname
and b1.bigno = spc.id
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

