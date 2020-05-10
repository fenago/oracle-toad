/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/

DECLARE
  v_count  NUMBER(10);
  v_username varchar2(30);
  cursor c_users IS
  SELECT COUNT(*), username
  FROM v$session
  WHERE username IS NOT NULL
  GROUP BY username;
BEGIN
OPEN c_users;
LOOP
FETCH c_users INTO  v_count, v_username;
EXIT WHEN c_users%NOTFOUND;
INSERT INTO history VALUES (systimestamp,v_username,v_count);
COMMIT;
END LOOP;
CLOSE c_users;
END;
