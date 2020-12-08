SELECT substr(o_orderdate, 1, 4), r_name, COUNT(*)
FROM orders, region, lineitem, nation, supplier
WHERE o_orderpriority = '1-URGENT'
    AND l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
GROUP BY substr(o_orderdate, 1, 4), r_name
ORDER BY substr(o_orderdate, 1, 4), r_name