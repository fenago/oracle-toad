SELECT O.UPC, O.SSN_SM OFFICER_SSN,O.GR_ABBR_CODE,
S.MPC,S.SSN_SM,S.UPC,S.GR_ABBR_CODE
FROM PERS_SVCMBR_TBL S,
             PERS_SVCMBR_TBL O
WHERE  O.MPC = 'O'
              AND    S.MPC NOT IN ('O','W')
              AND S.UPC = O.UPC AND
S.UPC='YLMAA' AND O.SSN_SM='824490336'
/
