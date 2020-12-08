SELECT COUNT(*)
FROM nation, customer, orders, lineitem, supplier, region
WHERE c_nationkey = 1
    AND o_custkey = c_custkey
    AND o_orderkey = l_orderkey
    AND l_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'ASIA';