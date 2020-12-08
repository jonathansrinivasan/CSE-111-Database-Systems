SELECT r_name, COUNT(DISTINCT c_name)
FROM nation, customer, orders, region 
WHERE n_regionkey = r_regionkey
      AND n_nationkey = c_nationkey 
      AND c_acctbal > (SELECT AVG(c_acctbal) 
                       FROM customer) 
      AND NOT c_custkey IN (SELECT o_custkey 
                            FROM orders) 
GROUP BY r_name;