declare
v_deptno dept.deptno%type :=&p_deptno;
v_loc dept.loc%type :=&p_loc;
begin
update dept
set loc=v_loc
where deptno=v_deptno;
commit work;
end;
/
