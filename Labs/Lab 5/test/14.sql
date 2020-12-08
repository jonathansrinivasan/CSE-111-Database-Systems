SELECT sr.r_name, cr.r_name, SUBSTR(l_shipdate,1,4), SUM(l_extendedprice*(1-l_discount)) 
FROM lineitem, orders, customer, nation cn, region cr, supplier, nation sn, region sr 
WHERE l_orderkey = o_orderkey 
      AND o_custkey = c_custkey 
      AND c_nationkey = cn.n_nationkey 
      AND cn.n_regionkey = cr.r_regionkey 
      AND l_suppkey = s_suppkey 
      AND s_nationkey = sn.n_nationkey 
      AND sn.n_regionkey = sr.r_regionkey 
      AND substr(l_shipdate,1,4) IN ('1995','1996') 
GROUP BY sr.r_name, cr.r_name, substr(l_shipdate,1,4) 
ORDER BY sr.r_name, cr.r_name, substr(l_shipdate,1,4);