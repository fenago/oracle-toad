SELECT name_ind
  || ' '
  || ' has '
  || apft_score
  || ' complete but wants '
  || 3 * apft_score
  || ' times the apft scores ' "Dream Scores"
FROM pers_PERSON_TBL
WHERE name_ind LIKE upper('&a_name%')
AND apft_score IS NOT NULL
