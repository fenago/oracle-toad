DECLARE
  v_Books  BookList :=
  BookList(BookObj('A History of the World','RICHARD',2001),
           BookObj('Another World History', 'JONES',2002));
begin
update course_material
  set required_reading = v_books
  WHERE department = 'HIS'
and course = 301;
end;
/
