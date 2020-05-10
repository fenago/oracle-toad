select 
         regexp_replace('http://www.oracle.com/products and click on database',
  'http://([[:alnum:]]+\.?){3}{4}/?') RESULT
from dual
/
