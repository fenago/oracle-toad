SELECT 'INSERT INTO JUVENILE(',MEMBER_NO,',',ADULT_MEMBER_NO,',',
                 ''''||TO_CHAR(BIRTH_DATE,'YYYY-MM-DD HH:MM:SS')||'''',')'
          FROM JUVENILE
/
