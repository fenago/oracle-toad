/* for the staff table find the maximum employee  number by retrieving */
/* the current maximum number and adding 1 to it and loading these numbers */
/* into a table called emp_table..		  */
DECLARE
	TYPE emp_table_type IS TABLE OF NUMBER(5)
	INDEX BY BINARY_INTEGER;
   	emp_table 	emp_table_type;
	new_id         staff.id%TYPE := 0;
countr     number(3) := 1;
BEGIN
 while countr <= 10 loop
         Select max(id) + 1 into new_id  from staff;
         emp_table(countr) := new_id;
         countr := countr + 1;
 END LOOP;
COMMIT;
END;
/

