/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/
connect student1/student1 as sysdba

set echo on;

drop tablespace big_ts including contents and datafiles;
drop tablespace t1_sideris including contents and datafiles;
drop tablespace t2_sideris including contents and datafiles;

set echo off;
