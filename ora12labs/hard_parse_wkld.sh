sqlplus -S /nolog <<-EOF
	connect / as sysdba
	exec DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT();

	connect perfstat/perfstat
	execute statspack.snap

	connect system/oracle_4U
	alter system flush shared_pool;

	connect hr/hr
	@hard_parse_emp

	connect sh/sh
	@hard_parse_sales 
	@hard_parse_sales2

	connect oe/oe
	@hard_parse_oe

	connect perfstat/perfstat
	execute statspack.snap

	exit
	EOF
