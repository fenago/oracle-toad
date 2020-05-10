select pay_gr,max(apft_score) "Maximum",
       min(apft_score) "Minimum", 
       sum(apft_score) "Sum", 
       round(avg(apft_score),0) "Average"
from person
group by pay_gr
/
