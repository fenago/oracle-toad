select substr(name_ind,1,instr(name_ind,'  ')) LAST_NAME, states_us, to_char(null),to_char(null)
from pers_person_tbl
where ssn_sm < '100551212'
union all
select to_char(null),to_char(null),upc, gr_abbr_code
from pers_svcmbr_tbl
where ssn_sm < '100551212'