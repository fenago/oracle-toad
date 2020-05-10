DECLARE
 v_Student1  StudentObj  :=
  StudentObj(10020,'Dave','Stohl',NULL,0);
 v_Student2  StudentObj  :=
  StudentObj(10030,'Larry','Ruckman',NULL,0);
BEGIN
 v_Student1.ChangeMajor('Economics');
 v_Student2.ChangeMajor('Computer Science');
DBMS_OUTPUT.PUT_LINE(v_Student1.FormattedName);
DBMS_OUTPUT.PUT_LINE(v_Student2.FormattedName());
end;
/
