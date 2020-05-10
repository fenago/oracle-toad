select substr(name_ind,1,instr(name_ind,'  ')) Last_Name, apft_score
from pers_person_tbl
where ssn_sm in (select ssn_sm from pers_svcmbr_tbl
                 where upc in (select upc from pers_svcmbr_tbl natural join
                                              pers_person_tbl
                                where ssn_sm in (select ssn_sm from pers_person_tbl
                                                where name_ind = 'NIELSON  ALLEN')))
                                                
                                                