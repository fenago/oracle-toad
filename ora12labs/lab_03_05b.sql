select initcap(name_ind) "Name Ind", 
       length(name_ind) "length of NAME"
from pers_person_tbl
where name_ind like upper('&First_Letter%')
/
