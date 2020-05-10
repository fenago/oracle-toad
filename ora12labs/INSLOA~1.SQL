SELECT 'INSERT INTO LOANHIST(',
          ISBN,',',COPY_NO,',',
          TO_CHAR(OUT_DATE,'YYYY-MM-DD HH:MM:SS'),',',
           TITLE_NO,',',
           MEMBER_NO,',',
           TO_CHAR(DUE_DATE,'YYYY-MM-DD HH:MM:SS'),',',
           TO_CHAR(IN_DATE,'YYYY-MM-DD HH:MM:SS'),',',
           NVL(FINE_ASSESSED,0),',',
           NVL(FINE_PAID,0),',',
           NVL(FINE_WAIVED,0),',',
           NVL(REMARKS,'NO REMARKS'),')'
          FROM LOANHIST
/
