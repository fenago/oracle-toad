sqlplus system/password
create user sidpers identified by password;
grant dba to sidpers;
host
parmfile.cmd
exit
conn sidpers/password
drop view tab;
exit


