connect sidpers/password
set echo on
drop user spm cascade;
create user spm identified by spm;
grant dba to spm;
alter system set SHARED_POOL_SIZE = 220M SCOPE = MEMORY;
alter system flush shared_pool;
/
