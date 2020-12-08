SELECT COUNT(*)
FROM (SELECT DISTINCT o_clerk
      FROM orders, supplier, nation, lineitem 
      WHERE o_orderkey = l_orderkey  
            AND l_suppkey = s_suppkey 
            AND s_nationkey = n_nationkey 
            AND n_name = 'CANADA');
