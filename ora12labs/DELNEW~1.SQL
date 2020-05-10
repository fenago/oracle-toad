DELETE FROM new_juv S
		WHERE s.member_no = 8788 and S.ROWID > (SELECT MIN(X.ROWID)
		FROM new_juv X
		WHERE X.member_no = S.member_no)
/
