/* 
Copyright (c) 2004 Sideris Consulting Group, Inc. All Rights Reserved.
This file is licensed for use only by those instructors and students
who have received a valid license for the Sideris courseware title
associated with this file. All other use, duplication or distribution
is prohibited and illegal.
*/
connect student1/student1 as sysdba
set echo on;

EXECUTE DBMS_RESOURCE_MANAGER.CREATE_PENDING_AREA();



EXECUTE DBMS_RESOURCE_MANAGER.CREATE_CONSUMER_GROUP ( -
consumer_group => 'OLTP', -
comment => 'online user');


execute DBMS_RESOURCE_MANAGER.CREATE_PLAN ( -
plan=> 't_plan', -
comment => 'this is a sample plan');



execute DBMS_RESOURCE_MANAGER.CREATE_PLAN_DIRECTIVE ( -
plan=> 't_plan', -
group_or_subplan => 'OTHER_GROUPS', -
comment => 'this plan is for everyone else');

set echo off; 