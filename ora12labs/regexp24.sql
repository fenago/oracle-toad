select * from test
where regexp_like(testcol, '[[:space:]]{3}')
/
