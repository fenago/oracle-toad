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
         /* Student has no books checked out.
          V_Books  := BookList(NULL);
end;
/*  Search the list to see if this student already has this book.*/
  FOR v_Counter  IN  1..v_Books.COUNT LOOP
    v_Book   := v_Books(v_Counter);
IF (v_Book.catalog_number = p_NewBook.catalog_number) THEN
    RAISE_APPLICATION_ERROR(-20001,'Book is already checked out');
     END IF;
END LOOP;
/* Check out the book by adding it to the list. */
  IF v_Books.COUNT = v_Books.LIMIT THEN
RAISE_APPLICATION_error(-20001,'Cannot check out any more books');
      END IF;
/* Check out the book by adding it to the list. */
V_Books.EXTEND;
v_Books(v_Books.COUNT)  :=  p_NewBook;
  /*  Put it back in the database. */
     UPDATE checked_out
     SET books = v_Books
	WHERE   student_id = p_StudentID;
      IF SQL%NOTFOUND  THEN
         INSERT INTO checked_out (student_id,books)
		VALUES(p_StudentID, v_Books);
       END IF;

END CheckOut;
/

