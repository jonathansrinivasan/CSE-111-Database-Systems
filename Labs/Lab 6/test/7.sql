SELECT COUNT(DISTINCT(l_suppkey))
FROM (SELECT l_suppkey, COUNT(DISTINCT o_orderkey) AS num
      FROM nation, customer, lineitem, orders 
      WHERE (n_name = 'GERMANY' OR n_name = 'FRANCE')
             AND c_custkey = o_custkey
             AND o_orderkey = l_orderkey
             AND n_nationkey = c_nationkey
             GROUP BY l_suppkey) AS answer
WHERE answer.num < 30;