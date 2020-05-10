select id,clob_field "CLOB",utl_raw.cast_to_varchar2(blob_field) "BLOB" from test_lob
/
