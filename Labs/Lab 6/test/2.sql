SELECT COUNT(num)
FROM (SELECT COUNT(DISTINCT(o_custkey)) AS num 
      FROM customer, orders
      WHERE c_custkey = o_custkey
            AND o_orderdate LIKE '%1996-08%'
            GROUP BY o_custkey
            HAVING COUNT(o_orderkey) <= 2);