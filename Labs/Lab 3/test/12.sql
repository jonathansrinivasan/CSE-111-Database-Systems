SELECT r_name, COUNT(o_orderkey)
FROM region, orders, customer, nation
WHERE o_orderstatus = 'F'
    AND o_custkey = c_custkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
GROUP BY r_regionkey