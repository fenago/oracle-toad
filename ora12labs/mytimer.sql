IN when-new-form-instance trigger

DECLARE 
    timer_id Timer; 
    one_second NUMBER(5) := 1000; 
BEGIN 
    timer_id := CREATE_TIMER('mytimer', one_second, REPEAT); 
END; 

DECLARE 
  tiff_image_dir VARCHAR2(80) := 'c:\my pictures\'; 
  photo_filename VARCHAR2(80);
  vNo_Of_Picture CONSTANT INTEGER := 10;
  vPicture_Name VARCHAR2(50) := 'myimage_';
BEGIN 

  photo_filename := tiff_image_dir||vPicture_Name||LPAD(To_Char(:counter), 3, '0')||'.tif'; 
  READ_IMAGE_FILE(photo_filename, 'TIFF', 'myimage');

  IF NOT FORM_SUCCESS THEN
    MESSAGE('can not read image');
  END IF;

  SYNCHRONIZE;

  IF :counter = vNo_Of_Picture THEN
     :counter := 1;
  ELSE
     :counter := :counter + 1;
  END IF;
  
END; 
