CREATE OR REPLACE FUNCTION business_date (start_date DATE,
Days2Add NUMBER) RETURN DATE IS

Counter  NATURAL := 0;
CurDate  DATE := start_date;
DayNum   POSITIVE;
SkipCntr NATURAL := 0;

BEGIN
  WHILE Counter < Days2Add
  LOOP
    CurDate := CurDate+1;
    DayNum := TO_CHAR(CurDate, 'D');

    IF DayNum BETWEEN 2 AND 6 THEN
      Counter := Counter + 1;
    ELSE
      SkipCntr := SkipCntr + 1;
    END IF;
  END LOOP;
  RETURN start_date + Counter + SkipCntr;
END business_date;
/
