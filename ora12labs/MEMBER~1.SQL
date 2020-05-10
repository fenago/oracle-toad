select 'insert into member values(',',',
        member_no,',','?',lastname,'?',','
   ,'?',FIRSTname,'?',','
   ,'?',MIDDLEINITIAL,'?',',','NULL'
   FROM MEMBER
       WHERE MEMBER_NO  = 1
/
