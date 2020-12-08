SELECT o_custkey, COUNT(l_discount)
FROM lineitem, orders
WHERE l_discount >= 0.05
    AND l_orderkey = o_orderkey
GROUP BY o_custkey
HAVING COUNT(l_discount) >= 70




