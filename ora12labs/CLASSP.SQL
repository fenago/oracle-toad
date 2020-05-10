CREATE OR REPLACE PACKAGE ClassPackage is
   /*  add a new student into a specified class   */
 PROCEDURE AddStudent(p_StudentID IN students.id%type,
       p_Department IN students.department%type,
     p_Course  IN students.course%type);
/* Add a new student by specifying first and last name rather than ID*/
PROCEDURE AddStudent(p_FirstName IN students.first_name%type,
        p_LastName IN students.last_name%type,
        p_Department IN students.department%type,
	p_Course  IN students.course%type);
END ClassPackage;

/
