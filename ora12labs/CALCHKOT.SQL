DECLARE
  v_RequiredBooks    BookList;
  v_Books    BookObj;
  BEGIN
   SELECT required_reading
   into v_RequiredBooks
    from course_material
  WHERE department = 'CS'
   and  course = 101;
FOR v_Counter IN 1..v_RequiredBooks.COunt LOOP
  v_BookS := v_RequiredBooks(v_Counter);
 Checkout(1002, v_BookS);
  END LOOP;
END;
/
