SELECT DISTINCT s_name, p_size, MIN(ps_supplycost)
FROM nation, supplier, partsupp, part, region
WHERE p_type LIKE '%STEEL%'
    AND r_name = 'AMERICA'
    AND n_regionkey = r_regionkey
    AND s_nationkey = n_nationkey
    AND p_partkey = ps_partkey
    AND ps_suppkey = s_suppkey
GROUP BY p_size;