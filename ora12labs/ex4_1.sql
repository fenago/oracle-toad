select name_ind || ' ' || 'has ' || apft_score || ' ' || 'complete but wants ' || apft_score * 3  "Dream Score"
from pers_person_tbl
where ssn_sm < '100551212'
/
