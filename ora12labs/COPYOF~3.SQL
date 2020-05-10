create or replace type ErrorObj AS OBJECT (
attribute NUMBER,
 MEMBER PROCEDURE RaiseError(p_RaiseIt IN BOOLEAN,
                             p_OutParam  IN OUT NUMBER),
MEMBER PROCEDURE Print(p_Comment IN VARCHAR2 DEFAULT NULL)
);
/
