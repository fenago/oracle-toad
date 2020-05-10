 DECLARE
    v_Books  BookList  :=
  BookList (BookObj ('A History of the World','RICHARD',2001));
 BEGIN
    /*  INSERT using a newly constructed nested table of 2 elements */
    INSERT INTO course_material VALUES(
   'CS',101,BookList(BookObj('Oracle8 and a Cat-O-NINE Tails','Jerry',1000),
       BookObj('SQL Server and Dogs','Mr Bill',2000),
       BookObj('DB2  and Universal DBs','UNKNOWN',3000)));
end;
/
