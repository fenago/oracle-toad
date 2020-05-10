CREATE OR REPLACE PROCEDURE CheckOut (
 p_StudentID IN NUMBER,
   p_NewBook IN BookObj)  AS
   v_Books  BookList2;
   v_Found  BOOLEAN  := FALSE;
   v_Book BookObj;
BEGIN
  SELECT books
 into v_Books
 from checked_out
 WHERE student_id = p_StudentID;
  EXCEPTION
 WHEN NO_DATA_FOUND THEN
         /* Student has no books checked out.*/
          V_Books  := BookList2(NULL);
END;
/
