DECLARE

cursor j_cursor is
     select ins,
            member_no,
            adult_member_no,
            to_char(birth_date,'yyyy-mm-dd hh:mm:ss') birth_date
     from ins_juvenile
     ;
jrecord j_cursor%rowtype;
BEGIN
  FOR jrecord IN j_cursor LOOP
    jrecord.member_no := '?'||rtrim(jrecord.member_no)||'?';
    jrecord.adult_member_no := '?'||rtrim(jrecord.adult_member_no)||'?';
      INSERT INTO new_juv (member_no,adult_member_no,birth_date)
      values(jrecord.member_no,jrecord.adult_member_no,jrecord.birth_date);
     END LOOP;
COMMIT work;
END;
/
