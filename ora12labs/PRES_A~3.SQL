SELECT P.PRES_NAME,P.PARTY,H.HOBBY
          FROM PRESIDENT P, PRES_HOBBY H
          WHERE P.PRES_NAME = H.PRES_NAME
/
