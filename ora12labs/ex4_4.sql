select substr(name_ind,1,instr(name_ind,'  ')-1) "LAST NAME",
 to_char(add_months(to_date(dob,'YYYYMMDD'),6),'Day, "The" ddspth "of" Month') DOB,
 to_char(to_date(date_scty_clnc,'YYYYMMDD'),'Day, "The" ddspth "of" Month') "Security Clearance Date"
from pers_person_tbl
where ssn_sm < '102551212' and
      date_scty_clnc <> '00000000'
/
