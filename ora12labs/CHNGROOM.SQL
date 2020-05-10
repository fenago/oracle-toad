 DECLARE
  v_NewRoom    RoomObj :=
    RoomObj(99990, 'Building 7',200,50,'Discussion Room F');
  v_RoomRef     REF RoomObj;
 BEGIN
 /*  The RETURNING clause on this statement puts a reference to the newly
 inserted room into v_RoomRef. */
 INSERT INTO rooms r VALUES (V_NewRoom)
    RETURNING REF  ( r ) INTO v_RoomRef;
 UPDATE CLASSES
    SET ROOM = V_RoomREf
   WHERE department = 'NUT' and course = 307;
 END;
/
