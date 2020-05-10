CREATE OR REPLACE TYPE BODY Studentobj AS
 MEMBER FUNCTION FormattedName
    RETURN VARCHAR2 IS
  BEGIN
   RETURN SELF.first_name || ' ' || SELF.last_name;
 END FormattedName;

 MEMBER PROCEDURE ChangeMajor(p_NewMajor IN VARCHAR2) IS
  BEGIN
     major := p_NewMajor;
 END ChangeMajor;

 MEMBER PROCEDURE UpdateCredits(p_CompletedClass IN ClassObj)
   IS
  BEGIN
   current_credits := current_credits +
p_CompletedClass.num_credits;
  END UpdateCredits;
END;
/
