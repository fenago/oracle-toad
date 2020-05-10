DECLARE
port NUMBER;
Begin
port := dbms_xdb_config.gethttpport;
dbms_output.put_line('DB user port for EM
Express:'||to_char(PORT));
END;
/
