SELECT NAME_IND, to_char(to_date(DOB,'YYYYMMDD'),'Day, " the"
 ddspth " of" fmMonth, yyyy'),
ADD_MONTHS(TO_DATE(DATE_SCTY_CLNC,'YYYYMMDD'),6) review
from pers_person_tbl
where ssn_sm < '100551212'
and date_scty_clnc between ('00000101 and '20160101')
/
