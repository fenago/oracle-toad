 DECLARE
    v_Student1     StudentObj :=
   StudentObj(10020,'Jerry','Rich',NULL,0);
     v_Student2  StudentObj :=
   StudentObj(10021,'Emma','Peel',NULL,0);
 BEGIN
 --Change the majors of each instance of the above objects
   v_Student1.ChangeMajor('Economics');
  v_Student2.ChangeMajor('Computer Science');

 --Print out Student's name
        dbms_OUTPUT.PUT_LINE(v_Student1.FormattedName);
  dbms_OUTPUT.PUT_LINE(v_Student2.FormattedName());
 END;

/
