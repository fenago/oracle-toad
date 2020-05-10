SET ECHO ON;
SET TIMING ON;
begin
DBMS_SQLTUNE.CREATE_SQLSET (sqlset_name => 'STS_BIG');
dbms_sqltune.capture_cursor_cache_sqlset(
sqlset_name => 'STS_BIG' ,
basic_filter=> q'# module
like 'BIG%' and sql_text not like '%applicat%' and
parsing_schema_name in ('SCOTT') #' ,
time_limit => 12*60,
repeat_interval => 5);
end ;
/
