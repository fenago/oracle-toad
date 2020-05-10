Rem    CREATED by Chaitanya Koratamaddi - 10/11/06
Rem    This script creates the role ora with privileges
Rem    The role ora is then granted to users ora1-40
Rem    Added additional privileges to ora role

set echo on
spool Create_ora.log

drop role ora;
create role ora;
grant alter session to ora;
grant create session to ora;
grant create table to ora;
grant create view to ora;
grant create sequence to ora;
grant create synonym to ora;
grant create procedure to ora; 
grant create trigger to ora;
grant create type to ora;
grant query rewrite to ora;
grant create any index to ora;
grant create public synonym to ora;
grant create role to ora;
grant create user to ora;
grant create any directory to ora;
grant drop public synonym to ora;

grant execute on sys.dbms_stats to ora;
grant create job to ora;
grant manage scheduler to ora;
grant debug connect session to ora;
grant debug any procedure to ora;
grant execute any procedure to ora;
grant select on v_$parameter TO ora;

drop user ora1 cascade;
create user ora1 identified by ora1;
grant ora to ora1;
alter user ora1 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora2 cascade;
create user ora2 identified by ora2;
grant ora to ora2;
alter user ora2 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora3 cascade;
create user ora3 identified by ora3;
grant ora to ora3;
alter user ora3 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora4 cascade;
create user ora4 identified by ora4;
grant ora to ora4;
alter user ora4 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora5 cascade;
create user ora5 identified by ora5;
grant ora to ora5;
alter user ora5 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora6 cascade;
create user ora6 identified by ora6;
grant ora to ora6;
alter user ora6 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora7 cascade;
create user ora7 identified by ora7;
grant ora to ora7;
alter user ora7 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora8 cascade;
create user ora8 identified by ora8;
grant ora to ora8;
alter user ora8 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora9 cascade;
create user ora9 identified by ora9;
grant ora to ora9;
alter user ora9 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora10 cascade;
create user ora10 identified by ora10;
grant ora to ora10;
alter user ora10 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora11 cascade;
create user ora11 identified by ora11;
grant ora to ora11;
alter user ora11 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora12 cascade;
create user ora12 identified by ora12;
grant ora to ora12;
alter user ora12 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora13 cascade;
create user ora13 identified by ora13;
grant ora to ora13;
alter user ora13 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora14 cascade;
create user ora14 identified by ora14;
grant ora to ora14;
alter user ora14 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora15 cascade;
create user ora15 identified by ora15;
grant ora to ora15;
alter user ora15 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora16 cascade;
create user ora16 identified by ora16;
grant ora to ora16;
alter user ora16 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora17 cascade;
create user ora17 identified by ora17;
grant ora to ora17;
alter user ora17 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora18 cascade;
create user ora18 identified by ora18;
grant ora to ora18;
alter user ora18 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora19 cascade;
create user ora19 identified by ora19;
grant ora to ora19;
alter user ora19 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora20 cascade;
create user ora20 identified by ora20;
grant ora to ora20;
alter user ora20 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora21 cascade;
create user ora21 identified by ora21;
grant ora to ora21;
alter user ora21 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora22 cascade;
create user ora22 identified by ora22;
grant ora to ora22;
alter user ora22 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora23 cascade;
create user ora23 identified by ora23;
grant ora to ora23;
alter user ora23 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora24 cascade;
create user ora24 identified by ora24;
grant ora to ora24;
alter user ora24 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora25 cascade;
create user ora25 identified by ora25;
grant ora to ora25;
alter user ora25 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora26 cascade;
create user ora26 identified by ora26;
grant ora to ora26;
alter user ora26 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora27 cascade;
create user ora27 identified by ora27;
grant ora to ora27;
alter user ora27 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora28 cascade;
create user ora28 identified by ora28;
grant ora to ora28;
alter user ora28 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora29 cascade;
create user ora29 identified by ora29;
grant ora to ora29;
alter user ora29 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora30 cascade;
create user ora30 identified by ora30;
grant ora to ora30;
alter user ora30 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora31 cascade;
create user ora31 identified by ora31;
grant ora to ora31;
alter user ora31 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora32 cascade;
create user ora32 identified by ora32;
grant ora to ora32;
alter user ora32 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora33 cascade;
create user ora33 identified by ora33;
grant ora to ora33;
alter user ora33 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora34 cascade;
create user ora34 identified by ora34;
grant ora to ora34;
alter user ora34 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora35 cascade;
create user ora35 identified by ora35;
grant ora to ora35;
alter user ora35 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora36 cascade;
create user ora36 identified by ora36;
grant ora to ora36;
alter user ora36 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora37 cascade;
create user ora37 identified by ora37;
grant ora to ora37;
alter user ora37 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora38 cascade;
create user ora38 identified by ora38;
grant ora to ora38;
alter user ora38 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora39 cascade;
create user ora39 identified by ora39;
grant ora to ora39;
alter user ora39 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora40 cascade;
create user ora40 identified by ora40;
grant ora to ora40;
alter user ora40 default tablespace users temporary tablespace temp
quota unlimited on users;

spool off
set echo off



