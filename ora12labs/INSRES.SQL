SELECT 'INSERT INTO RESERVE(',ISBN,',',MEMBER_NO,',',
        TO_CHAR(LOG_DATE,'YYYY-MM-DD HH:MM:SS'),',',NVL(REMARKS,'NO REMARKS')
          FROM RESERVE
/
