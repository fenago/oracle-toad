set termout off
set echo off
set feedback off
select b1.bigno, b2.bname,b3.bcomments
from big b1, big2 b2, bigpart b3
where b1.bigno = b2.bigno 
and b1.bigno = b3.bigno 
and b1.bname = b3.bname
and b3.bcomments like '%TEST%';
select b1.bigno, b2.bname,b2.b2comments,b3.bcomments,b3.binteger
from big b1, big2 b2, bigpart b3
where b1.bigno = b2.bigno 
and b1.bigno = b3.bigno 
and b1.bname = b3.bname
and b3.bcomments like '%TEST%' and b1.binteger between 5000 and 900000;