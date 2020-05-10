/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/

set echo on;

connect student1/student1

CREATE OR REPLACE FUNCTION f_members 
(a VARCHAR2, b VARCHAR2) RETURN VARCHAR2
IS
x VARCHAR2 (2000);
c number;
BEGIN
for i in 1..10000000 loop
c:= i/100 +500 *4000;
end loop;
x := 'memberid = SYS_CONTEXT(''vpd_context'', ''memberno'')';
RETURN x;
END;
/


set echo off;