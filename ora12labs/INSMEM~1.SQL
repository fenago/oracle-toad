SELECT 'INSERT INTO MEMBER(',MEMBER_NO,',',
                ''''||LASTNAME||'''',',',
                ''''||FIRSTNAME||'''',',',
               ''''||MIDDLEINITIAL||'''',',',
                  NVL(PHOTOGRAPH,'NO PHOTO'),')'
          FROM MEMBER
/
