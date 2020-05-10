Select (UR * (UPS * OVERHEAD) + OVERHEAD) as "Bytes"
From (Select value as UR from V$PARAMETER where NAME = 'undo_retention'),
         (Select (sum(undoblks) / sum(((END_TIME - BEGIN_TIME) * 86400))) as UPS from V$UNDOSTAT),  (SELECT value as OVERHEAD from V$PARAMETER where
                                       NAME = 'db_block_size')
/
