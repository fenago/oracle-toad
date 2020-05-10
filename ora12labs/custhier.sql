select decode(level,1,1,-1) level,
       initcap(name),'person',custid
from customer
  start with repid is null
  connect by prior
/
