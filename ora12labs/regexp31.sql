select * from test
where regexp_like(testcol, '([az])\1', 'i')
/
