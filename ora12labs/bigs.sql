select b1.bigno, b2.bname,b3.bcomments
from big b1, big2 b2, bigpart b3
where b1.bigno = b2.bigno 
and b1.bigno = b3.bigno 
and b1.bname = b3.bname
and b3.bcomments like '%TEST%'
/
