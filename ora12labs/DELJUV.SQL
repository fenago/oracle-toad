DELETE FROM adult S
  WHERE s.member_no between 401 and 600 and S.ROWID > (SELECT MIN(X.ROWID)
       FROM adult X
       WHERE X.member_no = S.member_no)
/
