select c.custid,c.name,c.creditlimit,o.ordid,o.shipdate,i.itemid,i.qty
from customer c, ord o, item i
where c.custid = o.custid and o.ordid = i.ordid
/
