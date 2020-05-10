DECLARE
new_po    puorder.po%TYPE;
cur_date   puorder.po_date%TYPE;
countr     number(3) := 1;
BEGIN
 for i in 1..10 loop
         Select max(po) + 1 into new_po  from puorder;
         INSERT INTO puorder (PO,PO_DATE) VALUES(new_po,sysdate);
 END LOOP;
COMMIT;
END;
/
