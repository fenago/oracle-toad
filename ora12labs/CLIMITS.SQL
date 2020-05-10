DECLARE
   v_Table   NumTab  := NumTab(-7, 14.3, 3.14159, NULL, 0);
   v_Count   BINARY_INTEGER   := 1;
   v_Array   NumVar   :=  NumVar(-1, -2, -3, -4);
   v_Index   INTEGER;
BEGIN
  /*  Loop over v_Table, and print out the elements, using EXISTS to indicate
      the end of the loop. */
LOOP
 IF v_Table.EXISTS(v_COUNT) THEN
       DBMS_OUTPUT.PUT_LINE(' v_Table(' || v_Count || '):  ' ||
   v_Table(v_COUNT));
     v_Count  := v_Count + 1;
/*  Prints v_Table(1): 7, v_Table(2): 14.3, v_Table(3): 3.14159, v_Table(4):*/
/* v_Table(5): 0  */
  ELSE
    EXIT;
 END IF;
END LOOP;
                   DBMS_OUTPUT.PUT_LINE(' Table Count:  '|| v_Table.COUNT);
  DBMS_OUTPUT.PUT_LINE(' v_array Count:  '||v_Array.COUNT);
/*  Prints  v_Table Count:  3        v_Varray Count 4    */
  DBMS_OUTPUT.PUT_LINE('v_array Limit: ' || v_array.LIMIT);
  DBMS_OUTPUT.PUT_LINE('v_array COUNT ' || v_array.COUNT);
 IF  v_Table.LIMIT is NULL THEN
  DBMS_OUTPUT.PUT_LINE('v_Table.LIMIT  IS NULL ');
  ELSE
  DBMS_OUTPUT.PUT_LINE('v_Table.LIMIT ' || v_Table.LIMIT);
 END IF;
      DBMS_OUTPUT.PUT_LINE('v_Table.COUNT: ' || v_Table.COUNT);
/*  v_Varray Limit is 25, v_Varray Count is 4,  v_Table Limit is NULL, v_Table COUNT is 5  */
 /*  Loop forwards over v_Varray  */
   v_Index  := v_array.FIRST; -- FIRST always is 1 in a varray
       while v_Index  <=   v_array.LAST LOOP -- LAST is always COUNT of varray
    DBMS_OUTPUT.PUT(v_array(v_Index));
 v_Index  := v_array.NEXT(v_Index);  -- Next always increments to next subscript
END LOOP;
     -- v_Table.TRIM(2);  -- v_Table now has 3 elements/ last two removed.
END;  /*  Delete will remove an entire table or range of elements  */
/
