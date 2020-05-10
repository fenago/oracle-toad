/* THIS IS A NOT WORKING EXAMPLE -- DO NOT EXECUTE */
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
  set custid = min_id;
  countr := countr + 1;
  exit when countr = totcount;
  end loop;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    ROLLBACK WORK;
    INSERT INTO EXCEPTION_TABLE(MESSAGE)
    VALUES(TO_CHAR(MIN_ID));
WHEN TOO_MANY_ROWS THEN
    ROLLBACK WORK;
    INSERT INTO EXCEPTION_TABLE(MESSAGE)
    VALUES('DUPLICATES IN THE PUORDER TABLE');
WHEN OTHERS THEN
    ROLLBACK WORK;
    INSERT INTO EXCEPTION_TABLE(MESSAGE)
    VALUES('OTHER ERROR OCCURED.');
COMMIT WORK;
end;
/
