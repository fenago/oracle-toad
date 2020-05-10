DELETE FROM member S
  WHERE s.member_no between 101 and 1000 and S.ROWID > (SELECT MIN(X.ROWID)
       FROM member X
       WHERE X.member_no = S.member_no)
/
