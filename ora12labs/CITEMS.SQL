select o.ordid, i.itemid, i.prodid, i.actualprice, i.qty, o.orderdate
  from ord o, product p
where o.ordid = p.ordid
/
