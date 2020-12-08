SELECT COUNT(DISTINCT s_name)
FROM supplier, part, partsupp
WHERE p_type LIKE '%MEDIUM POLISHED%' 
      AND ps_partkey = p_partkey
      AND ps_suppkey = s_suppkey
      AND p_size IN (3, 23, 36, 49);