SELECT DISTINCT(p_name)
FROM customer, lineitem, nation, orders, part, region
WHERE c_nationkey = n_nationkey
AND c_custkey = o_custkey
AND l_orderkey = o_orderkey
AND l_partkey = p_partkey
AND n_regionkey = r_regionkey
AND r_name = 'AMERICA'
AND p_name IN
(SELECT DISTINCT(p_name)
FROM part, partsupp, supplier, nation, region
WHERE r_name = 'ASIA'
AND p_partkey = ps_partkey
AND ps_suppkey = s_suppkey
AND s_nationkey = n_nationkey
AND n_regionkey = r_regionkey
GROUP by p_name
HAVING count(DISTINCT s_suppkey) = 4)
GROUP by l_orderkey  
