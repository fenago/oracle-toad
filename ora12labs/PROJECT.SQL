declare
new_id     project.empno%TYPE :=0;
newproj   project.projno%TYPE :=0;
countr    number(5) := 1;
begin
loop
select newprojno.nextval into newproj from dual;
select max(empno) + 10 into new_id from project; 
  insert into project (projno,empno) 
  values(newproj,new_id);
  countr := countr + 1;
  exit when countr = 50;
  end loop;
end;
/
