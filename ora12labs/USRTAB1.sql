SELECT TABLESPACE_NAME,
                      TABLE_NAME,
                      NUM_ROWS,
                      BLOCKS
               FROM DBA_TABLES 
WHERE TABLE_NAME=upper('&A_TABLE_NAME')
/
