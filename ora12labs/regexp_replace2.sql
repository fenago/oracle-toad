select 
         regexp_replace('500   Oracle   Parkway,
 Redwood   Shores, CA', ',[^,]+,') RESULT
from dual
/
