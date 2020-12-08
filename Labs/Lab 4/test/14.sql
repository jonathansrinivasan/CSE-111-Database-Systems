SELECT C.r_name AS c_region, S.r_name AS s_region, COUNT(*)
FROM lineitem, orders,
    (SELECT s_suppkey, r_name
     FROM supplier, nation, region
     WHERE s_nationkey = n_nationkey 
        AND n_regionkey = r_regionkey) AS S,
    (SELECT c_custkey, r_name
     FROM customer, nation, region
     WHERE c_nationkey = n_nationkey 
        AND n_regionkey = r_regionkey) AS C
WHERE S.s_suppkey = l_suppkey 
    AND l_orderkey = o_orderkey 
    AND o_custkey = C.c_custkey
GROUP BY C.r_name, S.r_name;