set termout off
select b1.bigno, b2.bname,b3.bcomments
from scott.big b1,  scott.bigpart b3
where b1.bigno = b3.bigno 
and b1.bname = b3.bname
and b3.bcomments like '%MILLION%';
select b1.bigno, b2.bname,b2.b2comments,b3.bcomments,b3.binteger
from scott.big b1, scott.big2 b2, scott.bigpart b3
where b1.bigno = b2.bigno 
and b1.bigno = b3.bigno 
and b1.bname = b3.bname
and b3.bcomments like '%TEST%' and b1.binteger between 5000 and 2000000;
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
where abs(b1.bigno)+0 = abs(b2.bigno)+0 
and b1.bigno = b3.bigno 
and b3.bname <> b1.bname
and b3.bcomments like '%TEST%' and b1.binteger between 5000 and 2000000;
@demobld
select bigno, bname, binteger,bcomments
from scott.big where bcomments like 'MILLION' and
bname like 'MILLION' AND BINTEGER BETWEEN 100 AND 2000000;
select bigno, bname, binteger,bcomments
from scott.bigPART where bcomments like 'MILLION' and
bname like 'MILLION' AND BINTEGER BETWEEN 100 AND 2000000;
update scott.bigpart
set today_date=sysdate;
select bname,today_date from scott.bigpart
where trunc(today_date) = trunc(sysdate) and
bname like '%2%';
select binteger,bcomments
from scott.big inner join scott.bigpart
using (bigno);
select big.bigno, big2.bname, big.bcomments
from scott.big left outer join scott.big2
on big.bigno = big2.bigno
where big.bname like '%2%';

