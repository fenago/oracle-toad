create user sidpers identified by password;
grant dba to sidpers;
host imp sidpers/password@orcl file=sidpers.dmp full=y 
--tables=pers_person_tbl,pers_svcmbr_tbl,pers_unit_tbl,pers_svcmbr_pay_tbl\0
conn sidpers/password@orcl
drop view tab;
exit