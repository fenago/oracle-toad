select ename, hiredate
from emp
where mgr = (select mgr from emp where ename = 'JAMES')