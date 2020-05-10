select ssn_sm, name_ind
from pers_person_tbl
where name_ind like '%U%' and 
ssn_sm in (select ssn_sm from pers_svcmbr_tbl where upc = 'TN6B0')