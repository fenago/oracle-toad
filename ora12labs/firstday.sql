CREATE OR REPLACE FUNCTION fday_ofmonth(value_in DATE)
RETURN DATE IS

vMo VARCHAR2(2);
vYr VARCHAR2(4);

BEGIN
  vMo := TO_CHAR(value_in, 'MM');
  vYr := TO_CHAR(value_in, 'YYYY');
  RETURN TO_DATE(vMo || '-01-' || vYr, 'MM-DD-YYYY');

EXCEPTION
  WHEN OTHERS THEN
    RETURN TO_DATE('01-01-1900', 'MM-DD-YYYY');

END fday_ofmonth;

/
