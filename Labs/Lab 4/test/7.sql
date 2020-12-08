SELECT n_name, o_orderstatus, COUNT(*)
FROM region, nation, customer, orders
WHERE o_custkey = c_custkey
      AND c_nationkey = n_nationkey
      AND n_regionkey = r_regionkey
      AND r_name = 'EUROPE'
GROUP BY n_name, o_orderstatus;
