CREATE OR REPLACE TYPE studentOBJ AS OBJECT(
id                  number(6),
first_name          VARCHAR2(20),
last_name           VARCHAR2(20),
major		    VARCHAR2(30),
current_credits     number(3),
MEMBER FUNCTION FormattedName
   RETURN VARCHAR2,
PRAGMA RESTRICT_REFERENCES(FormattedName,
  RNDS, WNDS, RNPS, WNPS),

MEMBER PROCEDURE ChangeMajor(p_NewMajor IN VARCHAR2),
PRAGMA RESTRICT_REFERENCES(ChangeMajor,
rnds, wnds, rnps, wnps),

MEMBER PROCEDURE UpdateCredits(p_CompletedClass IN ClassObj),
PRAGMA RESTRICT_REFERENCES(UpdateCredits,
RNDS, WNDS, RNPS, WNPS)
);
/
