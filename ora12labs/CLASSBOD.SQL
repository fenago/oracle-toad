CREATE OR REPLACE PACKAGE BODY ClassPackage AS
PROCEDURE AddStudent(p_StudentID IN students.id%type,
       p_Department IN students.department%type,
     p_Course  IN students.course%type) IS
BEGIN
INSERT INTO registered_students (studentid, department, course)
VALUES ( p_StudentID, p_Department, p_Course);
Commit;
END AddStudent;
/* Add the student by name */
PROCEDURE AddStudent(p_FirstName IN students.first_name%type,
        p_LastName IN students.last_name%type,
	p_Department IN students.department%type,
  	p_Course  IN students.course%type) IS
v_StudentID   students.ID%type;
BEGIN
SELECT ID  INTO v_StudentID from students
WHERE first_name = p_FirstName and last_name = p_LastName;
INSERT INTO registered_students (studentid, department, course)
VALUES ( v_StudentID, p_Department, p_Course);
Commit;
END AddStudent;
END ClassPackage;
/
