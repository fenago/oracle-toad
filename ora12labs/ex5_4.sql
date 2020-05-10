select max(apft_score) "Maximum",
       min(apft_score) "Minimum", 
       sum(apft_score) "Sum", 
       round(avg(apft_score),0) "Average"
from pers_person_tbl
/
