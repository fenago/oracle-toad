/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/

set echo on;

connect student1/student1 as sysdba

create  user user1
identified by user1
default tablespace siderisusers;

grant connect, resource to user1;

grant select on student1.members to user1;

set echo off;