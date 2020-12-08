SELECT COUNT(o_orderkey)
FROM orders, customer, nation
WHERE n_name = 'PERU'
      AND o_orderdate >= '1996-01-01'
      AND o_orderdate <= '1996-12-31'
      AND c_nationkey = n_nationkey
      AND o_custkey = c_custkey;

