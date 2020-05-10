/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/
set echo on;

connect student1/student1

CREATE TABLE history (
  h_time  TIMESTAMP WITH LOCAL TIME ZONE,
  h_username varchar2(10),
  num_sessions NUMBER);

column h_time format a30;


CREATE OR REPLACE PROCEDURE my_proc2
IS
t number;
BEGIN
FOR t IN 404..560 LOOP
INSERT INTO teams VALUES(t,'Sales','23-AUG-2002',t);
COMMIT;
END LOOP;
END;
/

set echo off;
