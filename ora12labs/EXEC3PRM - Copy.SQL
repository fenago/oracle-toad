 DECLARE
    X VARCHAR2(30);
    BEGIN
        three_parm('HELLO WORLD',X);
        DBMS_OUTPUT.PUT_LINE(X);
        three_parm(Y => X, X => 'HELLO WORLD', Z => 12);
        DBMS_OUTPUT.PUT_LINE(X);       
   end;
