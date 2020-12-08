SELECT s_name, o_orderpriority, COUNT(o_orderpriority)
FROM region, nation, supplier, lineitem, orders
WHERE r_name = 'AMERICA'
    and n_regionkey = r_regionkey
    AND n_nationkey = s_nationkey
    AND s_suppkey = l_suppkey
    AND l_orderkey = o_orderkey
GROUP BY s_name, o_orderpriority;