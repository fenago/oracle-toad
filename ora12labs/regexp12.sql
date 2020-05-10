select * from test
 where regexp_like(testcol,'[[:cntrl:]]{1}')
/
