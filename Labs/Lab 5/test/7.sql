SELECT o_orderpriority, COUNT(*) 
FROM lineitem, orders
WHERE o_orderdate LIKE '%1996%'
      AND l_receiptdate > l_commitdate
      AND l_orderkey = o_orderkey
GROUP BY o_orderpriority
ORDER BY o_orderpriority DESC;
