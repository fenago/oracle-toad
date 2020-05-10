 DECLARE
    v_Books  course_material.required_reading%TYPE;
    v_Course course_material.course%TYPE;
    v_Department course_material.department%TYPE;
  CURSOR c_AllBooks   IS
     SELECT required_reading,course,department
   from course_material;
 BEGIN
     /*  Loop over all the courses, and print out (using DBMS_OUTPUT) the
         required books */
 OPEN c_AllBooks;
  LOOP
     /*  Fetch all the columns in this row, including the entire nested table stored
         in required_reading */
      FETCH  c_AllBooks INTO v_Books,v_Course,v_Department;
  EXIT WHEN c_AllBooks%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE('Required Reading for '|| v_department || ' ');
   DBMS_OUTPUT.PUT_LINE(v_Course || ':');
   END LOOP;
END;
/
