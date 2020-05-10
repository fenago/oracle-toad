DECLARE
new_po    puorder.po%TYPE;
cur_date   puorder.po_date%TYPE;
countr     number(3) := 1;
BEGIN
 LOOP
         
         INSERT INTO puorder (PO,PO_DATE) 
	 select max(po) + 1,sysdate
	 from puorder;
         countr := countr + 1;
         exit when countr > 10;
 END LOOP;
COMMIT;
END;
/
