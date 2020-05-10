 DECLARE
  v_RoomID   rooms.id%TYPE;
  v_Building   rooms.building%TYPE;
  v_RoomNumber  rooms.room_number%TYPE;
  V_numberSeats  rooms.number_seats%TYPE;
  v_Description  rooms.description%TYPE;
  v_RoomObj   RoomObj;
 BEGIN
  SELECT *
  into  v_RoomID, v_Building, v_RoomNumber, V_NumberSeats,
   v_Description
  FROM Rooms
  WHERE ID = 99993;
 SELECT VALUE  ( r )
  INTO v_RoomObj
  from rooms r
  WHERE ID = 99993;
 END;
/
