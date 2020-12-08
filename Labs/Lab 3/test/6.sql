SELECT n_name
FROM orders, customer, nation
WHERE (o_orderdate >= '1995-03-10' AND o_orderdate <= '1995-03-12') 
    AND c_custkey = o_custkey
    AND n_nationkey = c_nationkey
GROUP BY c_nationkey
ORDER BY n_name