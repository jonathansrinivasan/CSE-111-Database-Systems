SELECT n_name, COUNT(DISTINCT(l_orderkey))
FROM orders, supplier, nation, region, lineitem
WHERE s_nationkey = n_nationkey 
      AND n_regionkey = r_regionkey 
      AND l_suppkey = s_suppkey 
      AND o_orderkey = l_orderkey 
      AND o_orderstatus = 'F'
      AND o_orderdate >= '1994-01-01'
      AND o_orderdate <= '1994-12-31'
GROUP BY n_name
HAVING COUNT(o_orderkey) >= 300;
