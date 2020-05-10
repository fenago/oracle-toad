select * from test
         where regexp_like
         (testcols, '[[:alnum:]]{5}')
/
