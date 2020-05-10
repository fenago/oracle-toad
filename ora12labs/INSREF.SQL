DECLARE
 v_ClassRef REF ClassObj;
BEGIN
 INSERT INTO CLASSES c  VALUES
 (ClassObj('HIS', 101, 'History 101', 30, 0, 4, NULL))
 RETURNING REF ( c ) INTO v_ClassRef;
END;
/
