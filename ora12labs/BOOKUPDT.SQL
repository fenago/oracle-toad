 DECLARE
    v_Books   BookList  :=
  BookList (BookObj('A History of the World', 'Smith',2001),
        BookObj('Another World History', 'Jones',2002));
 BEGIN

 /*  Example of Update processing with objects  */
   UPDATE course_material
  set required_reading = v_Books
  WHERE department = 'HIS'
  AND course = 301;

 /*  Example of Delete processing with objects */
 /*  The Delete removes a row with a nested table */
     DELETE FROM course_material
     WHERE department = 'HIS';
 END;
/
