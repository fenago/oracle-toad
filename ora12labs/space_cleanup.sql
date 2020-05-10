/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/
connect student1/student1 as sysdba

set echo on;

drop tablespace sideris including contents and datafiles;
alter system set undo_tablespace=UNDOTBS1;
drop tablespace sideris_undo;


DROP TABLE student1.teams;
CREATE TABLE student1.teams ( TeamID                  NUMBER(4),
                     Name                    VARCHAR2(15),
                     StartDate               DATE,
                     LeaderID                NUMBER(4)
                   );

INSERT INTO student1.teams VALUES (400, 'Management', '01-JAN-00', 500);
INSERT INTO student1.teams VALUES (401, 'Production', '01-JAN-00', 506);
INSERT INTO student1.teams VALUES (402, 'Engineering', '01-JAN-01', 505);
INSERT INTO student1.teams VALUES (403, 'Advertising', '10-JUN-02', 500);

set echo off;