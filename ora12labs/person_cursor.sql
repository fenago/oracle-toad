declare
i number(4) := 100;
cursor person_cursor is
 select APFT_SCORE
 from person
 for update of APFT_SCORE;
BEGIN
  FOR person_rec IN person_cursor LOOP 
     if person_rec.apft_score is null then
         person_rec.apft_score := i;
      else
      person_rec.apft_score := person_rec.apft_score;
     END IF;
      update person 
      set apft_score= PERSON_REC.apft_score
      where current of person_cursor;
    i := i + 1;
  if i = 300 then
     i := 100;
  end if;
  END LOOP;
commit;
end;
/
