 DECLARE
    TYPE t_Strings IS VARRAY(5) of VARCHAR2(10);
    /*  Declare a varray with three elements. The maximum size
     if this type is five elements */
 v_List     t_Strings    :=  t_Strings('Scott','David','Urman');
 BEGIN
    /*  Subscript between 1 and 3, so this is a legal assignment.*/
   v_List(2)  := 'David';
 end;
/
