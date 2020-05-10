select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal