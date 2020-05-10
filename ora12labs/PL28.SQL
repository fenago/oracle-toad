declare
new_id     ord.custid%TYPE :=0;
min_ord    ord.ordid%TYPE :=0;
new_ordid  ord.ordid%TYPE :=0;
totcount   number(6) :=0;
countr     number(6) :=0;
min_id     ord.custid%TYPE :=0;
begin
select count(*) into totcount from ord;
loop
select min(custid) into min_id from ord where custid > min_id;
select min(ordid) into new_ordid from ord where ordid > new_ordid;
  update puorder
  set custid = min_id
  where po = new_ordid;
  countr := countr + 1;
  exit when countr = totcount;
  end loop;
end;
/
