INSERT INTO reservation
SELECT member_no
     , isbn
     , SYSDATE
     , NULL
FROM member, item
WHERE member_no = isbn
/
