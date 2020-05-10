select substr(name_ind,1,instr(name_ind,'  ')) "Last Name", states_us, apft_score
from pers_person_tbl
where ssn_sm in (select ssn_sm from pers_svcmbr_tbl where gr_abbr_code='SSG6')