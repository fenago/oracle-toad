COLUMN TABLE_NAME FORMAT A11
COLUMN TABLEspace_NAME FORMAT A15
SELECT TABLE_NAME,
       TABLESPACE_NAME,
       INITIAL_EXTENT,
       avg_row_len,
       NUM_ROWS,
       blocks,
       empty_blocks,
       CHAIN_CNT
  FROM USER_TABLES
  WHERE TABLE_NAME = UPPER('&TABLENAME')
/
