SELECT SSN_SM, REC_PREC, NAME_IND, DOB, STATES_US,
       MPC,CUM_RET_PT, UPC, gr_abbr_code
from pers_person_tbl NATURAL JOIN pers_svcmbr_tbl
where  EXISTS
     (SELECT * FROM PERS_SVCMBR_TBL
      WHERE MPC = 'E' AND
      REC_PREC = '99999999' AND
      CUM_RET_PT > 100)
/
	 
