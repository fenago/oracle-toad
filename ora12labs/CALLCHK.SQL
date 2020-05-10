DECLARE
  v_RequiredBooks    BookList;
  v_Books    BookObj;
  BEGIN
   SELECT required_reading
   into v_RequiredBooks
    from course_material
  WHERE department = 'CS'
   and  course = 101;
FOR v_Counter IN..v_RequiredBooks.COunt LOOP
  v_Book := v_RequiredBooks(v_Counter);
 Checkout(1005, v_Book);
  END LOOP;
END;
/
