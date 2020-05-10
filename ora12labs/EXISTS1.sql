SELECT SSN_SM, REC_PREC, NAME_IND, DOB, STATES_US,
              CUM_RET_PT, UPC, gr_abbr_code
from pers_person_tbl inner join pers_svcmbr_tbl
using (ssn_sm, rec_prec)
where REC_PREC = '99999999' AND
      MPC='E' AND
      CUM_RET_PT > 100
/
