select * from test
 where regexp_like(testcol,'[[:digit:]]{5}')
/
