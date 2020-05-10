create or replace package pkgXXX AS
indy500_year number(4) := 1994;
procedure NEW_DEPTS (vdeptno  dept.deptno%type,
                    vname    dept.dname%type,
                     vloc        dept.loc%type);
    function days_old(dob date)
    return number;
end pkgXXX;
/
