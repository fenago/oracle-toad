SELECT REGEXP_SUBSTR(i.product_name, '^[a-z]+', 1, 1, 'i') || ' = '
   || regexp_substr(to_char(d.translated_name), '^[a-z]+', 1, 1, 'i')
FROM oe.product_descriptions d, oe.product_information i
WHERE d.language_id = 'PT'
AND d.translated_name like 'G%'
AND i.product_id = d.product_id ;
ALTER SESSION SET NLS_LANGUAGE=AMERICAN;