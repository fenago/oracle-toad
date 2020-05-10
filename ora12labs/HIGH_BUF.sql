SELECT
   objd      object,
   file#,
   block#,
   ts#      touches,
   status,
   xnc
FROM
   V$bh
WHERE 
   ts# > 10
ORDER BY 
   ts# desc;
