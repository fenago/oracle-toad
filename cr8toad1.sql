alter session set "_ORACLE_SCRIPT"=true; 

/* alter session set container=fenagodb1;
*/

create user scott identified by tiger;
grant connect,resource,create view, create synonym, select_catalog_role
to scott;
alter user scott quota unlimited on users;
create user sidpers identified by password;
grant dba to sidpers;
/* For the sidpers user, please run an imp on the dump file
   expsid14.dmp.  Do not run impdp - run imp after the sidpers
user is created */
