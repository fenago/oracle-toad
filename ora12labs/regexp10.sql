select * from test
where regexp_like(testcol, '[[:alpha:]]{3}')
/
