SELECT COUNT(DISTINCT(c_custkey))
FROM orders, customer
WHERE o_custkey = c_custkey
      AND o_orderkey NOT IN (SELECT DISTINCT(o_orderkey)
                             FROM region, nation, lineitem, orders, supplier 
                             WHERE r_name NOT IN ('ASIA')
                                    AND r_regionkey = n_regionkey
                                    AND s_suppkey = l_suppkey
                                    AND l_orderkey = o_orderkey
                                    AND s_nationkey = n_nationkey);
