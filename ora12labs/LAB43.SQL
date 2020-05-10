select Ename,dname,sal
from EMP E,DEPT D
where E.DEPTNO=D.deptNO(+) and (E.deptNO not in
(select deptNO from DEPT ) or E.deptNO is null)
/
