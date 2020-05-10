/* 
Copyright (c) 2002 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/

begin
        for i in 1..1000 loop
        	insert into employee (ssn, lname, fname, dno, salary)
        		values (900000000 + i, 'Doe', 'John', 1, 3000 + i);
        	commit;
        end loop;
        end;

