SELECT (SELECT SUM(l_extendedprice*(1-l_discount)) 
       FROM lineitem, orders, customer, nation cn, region cr, supplier, nation sn 
       WHERE sn.n_name = 'UNITED STATES'
            AND cr.r_name = 'EUROPE' 
            AND l_orderkey = o_orderkey 
            AND o_custkey = c_custkey 
            AND c_nationkey = cn.n_nationkey 
            AND cn.n_regionkey = cr.r_regionkey 
            AND l_suppkey = s_suppkey 
            AND s_nationkey = sn.n_nationkey 
            AND substr(l_shipdate,1,4) = '1996')/(SELECT SUM(l_extendedprice*(1-l_discount)) 
                                                   FROM lineitem, orders, customer, nation cn, region cr 
                                                   WHERE substr(l_shipdate,1,4) = '1996'
                                                      AND cr.r_name = 'EUROPE'
                                                      AND l_orderkey = o_orderkey 
                                                      AND o_custkey = c_custkey 
                                                      AND c_nationkey = cn.n_nationkey 
                                                      AND cn.n_regionkey = cr.r_regionkey);
