select max(apft_score), min(apft_score), 
max(apft_score) - min(apft_score) DIFFERENCE
FROM PERS_PERSON_TBL
/
