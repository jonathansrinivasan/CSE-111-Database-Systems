SELECT STRFTIME('%m', l_shipdate), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '%1997%'
GROUP BY STRFTIME('%m',l_shipdate);