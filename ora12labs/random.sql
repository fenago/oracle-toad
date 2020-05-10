DECLARE 
    i BINARY_INTEGER; 
BEGIN 
    dbms_random.initialize(19254); 
    i := dbms_random.random; 
    INSERT INTO some_table VALUES(i); 
    dbms_random.terminate; 
END; 
/
