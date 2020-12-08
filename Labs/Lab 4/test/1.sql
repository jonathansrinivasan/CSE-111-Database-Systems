
SELECT c_name, SUM(o_totalprice)
FROM (SELECT o_totalprice, c_custkey, o_custkey, c_name, n_name
      FROM orders, customer, nation 
      WHERE n_name = 'RUSSIA' 
            AND o_custkey = c_custkey
            AND c_nationkey = n_nationkey
            AND o_orderdate >= '1996-01-01' 
            AND o_orderdate <= '1996-12-31')
GROUP BY o_custkey;