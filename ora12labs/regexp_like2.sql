select * from test
         where regexp_like(testcols,'[[:upper:]]{2}')
/
