SELECT l_receiptdate, COUNT(*)
FROM orders, lineitem
WHERE o_custkey = '106' AND o_orderkey = l_orderkey
GROUP BY l_receiptdate