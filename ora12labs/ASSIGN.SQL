CREATE OR REPLACE PROCEDURE AssignName(
 p_Student   IN OUT StudentObj,
 p_FirstName   Students.student.first_name%TYPE,
 p_LastName    Students.student.last_name%type) 
 AS
 BEGIN
 IF p_Student IS NULL THEN
  RAISE_APPLICATION_ERROR(-20000,'Student is NULL');
 ELSE
  p_Student.first_name := p_FirstName;
  p_Student.last_name  := p_LastName;
END IF;
END AssignName;
/
