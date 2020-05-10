DECLARE
 v_Books  BookList :=
BookList(BookObj('A History of the World','RICHARD',2001));
BEGIN
  -- Insert using a newly constructed nested table of 2 elements.
INSERT INTO course_material VALUES (
  'CS', 101,
   BookList(BookObj('Oracle8 PL/SQL Programming',
                    'Urman',1000),
            BookObj('Oracle8: A Beginner''s Guide',
                     'Agpalo, Emma',1001),
            BookObj('Tuning Oracle',
                     'Sayasvanh, Ae',1002)));
 -- Insert using a previously initialized nested table of 1
insert into COURSE_MATERIAL VALUES
('HIS',301,v_Books);
end;
/
