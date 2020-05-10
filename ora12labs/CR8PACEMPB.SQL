Create OR Replace Package Body pkgXXX AS
Procedure NEW_DEPTS (vdeptno  dept.deptno%type,
                     vname   dept.dname%type,
                     vloc     dept.loc%type)
is
begin
   insert into dept
      values(vdeptno, vname, vloc);
end new_depts;
FUNCTION DAYS_OLD(DOB DATE)
 RETURN NUMBER
 IS
   L_DAYS_OLD NUMBER(10) := 0;
 BEGIN
   L_DAYS_OLD := SYSDATE-DOB;
   RETURN(L_DAYS_OLD);
 END DAYS_OLD;
end pkgXXX;
/
