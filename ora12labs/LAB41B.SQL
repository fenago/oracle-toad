SELECT DEPT,ID,NAME,SALARY,
   DECODE(DEPT,10,'CORPORATE',
               15,'NEW ENGLAND',
               20,'MID ATLANTIC',
               38,'SOUTH ATLANTIC',
               42,'GREAT LAKES',
               51,'PLAINS',
               66,'PACIFIC',
               84,'MOUNTAIN',DEPT) DEPTNAME
    FROM STAFF S
     WHERE SALARY =
 (SELECT MAX(SALARY) FROM STAFF
      WHERE S.DEPT = DEPT)
/
