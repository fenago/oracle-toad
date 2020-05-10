select name_ind || ' ' || ' has ' || apft_score || 
' complete but wants ' || 3 * apft_score || 
' times the apft scores '
    from pers_PERSON_TBL
     WHERE SSN_SM<'100551212' and apft_score is not null
/
