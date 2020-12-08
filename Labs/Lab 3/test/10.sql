SELECT sum(o_totalprice)
FROM orders, nation, customer, region
WHERE r_name = 'EUROPE' 
    AND n_nationkey = c_nationkey
    AND o_custkey = c_custkey 
    AND n_regionkey = r_regionkey
    AND strftime('%Y', o_orderdate) = '1996'