select * from test
where regexp_like(testcol, '[[:alnum:]]{5}')
/
