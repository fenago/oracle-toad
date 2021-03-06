CREATE OR REPLACE PACKAGE MANAGE_ZOO AS

PROCEDURE LOAD_SUMMARY;

FUNCTION GET_CAGE(P_ANIMAL_ID IN NUMBER)
RETURN NUMBER;

DUP_VAL CONSTANT NUMBER := -20300;

CURSOR GET_ANIMALS IS
    SELECT A.ANIMAL_NAME,T.DESCRIPTION,C.CAGE_NAME,
                  A.WEIGHT, NULL PCT_WEIGHT
   FROM ANIMAL A, ANCESTOR_TYPE T,CAGE C
    WHERE A.TYPE_ANCESTOR = T.TYPE_ANCESTOR
    AND A.CAGE_NO = C.CAGE_NO;

   TYPE ANI_REC_TYPE IS RECORD (
       ANIMAL_NAME ANIMAL.ANIMAL_NAME%TYPE,
       DESCRIPTION  ANCESTOR_TYPE.DESCRIPTION%TYPE,
       CAGE_NAME    CAGE.CAGE_NAME%TYPE,
       WEIGHT            ANIMAL.WEIGHT%TYPE,
       PCT_WEIGHT   INTEGER(4));
END MANAGE_ZOO;
/
