select grantee, owner, table_name, grantor, select_priv from table_privileges
where grantee like '%system%'
/
