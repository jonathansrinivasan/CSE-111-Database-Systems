SELECT AVG(c_acctbal)
FROM customer, nation, region
WHERE c_mktsegment = 'MACHINERY' AND c_nationkey = n_nationkey AND n_regionkey = 0