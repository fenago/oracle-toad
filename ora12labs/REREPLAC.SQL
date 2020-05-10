SELECT UNIQUE REGEXP_REPLACE (catalog_url, 'http://([^/]+).*', '\1')
FROM oe.product_information ;