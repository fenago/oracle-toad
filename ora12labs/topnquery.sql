SELECT ename, job, sal, rownum
 FROM     (select ename, job, sal from emp
        Order by sal desc)
 WHERE   rownum <=10
/
