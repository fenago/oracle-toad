SELECT id, dept,
COUNT(*) OVER ( ) CNT
FROM staff
WHERE dept IN (10, 20)
ORDER BY 2, 1
/
