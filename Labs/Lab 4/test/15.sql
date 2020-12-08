SELECT COUNT(*) 
FROM (SELECT DISTINCT o_orderkey
      FROM customer, orders, lineitem, supplier 
      WHERE c_custkey = o_custkey 
            AND l_suppkey = s_suppkey 
            AND o_orderkey = l_orderkey 
            AND s_acctbal < 0 
            AND c_acctbal < 0)
