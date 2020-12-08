SELECT AVG(julianday(l_shipdate) - julianday(l_commitdate))
FROM lineitem
WHERE julianday(l_shipdate) >= julianday(l_commitdate);