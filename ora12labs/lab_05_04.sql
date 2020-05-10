select pay_gr, max(apft_score) "Maximum", min(apft_Score) "Minimum",
                  sum(apft_score) "Sum", 
       ROUND(avg(apft_score),0) "Average"
           from person
group by pay_gr
/
