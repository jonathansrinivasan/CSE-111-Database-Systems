SELECT count(o_orderpriority)
FROM nation, customer, orders
WHERE n_nationkey = c_nationkey AND c_custkey = o_custkey AND n_name = 'FRANCE' AND o_orderpriority = '1-URGENT' AND o_orderdate >= '1996-01-01' AND o_orderdate <= '1996-12-31'