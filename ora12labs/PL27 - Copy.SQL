DECLARE
new_po    puorder.po%TYPE;
cur_date   puorder.po_date%TYPE;
countr     number(3) := 1;
BEGIN
 while countr <= 10 loop
         Select max(po) + 1 into new_po  from puorder;
         INSERT INTO puorder (PO,PO_DATE) VALUES(new_po,sysdate);
         countr := countr + 1;
 END LOOP;
COMMIT;
END;
/
