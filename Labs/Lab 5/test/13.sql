SELECT o_orderpriority, COUNT(*) 
FROM orders 
WHERE (o_orderdate LIKE '1996-10-%' 
       OR o_orderdate LIKE '1996-11-%'
       OR o_orderdate LIKE '1996-12-%') 
       AND EXISTS (SELECT * 
                   FROM lineitem 
                   WHERE l_commitdate < l_receiptdate 
                         AND o_orderkey = l_orderkey)
       GROUP BY o_orderpriority
       ORDER BY o_orderpriority;