SELECT COUNT(num)
FROM (SELECT COUNT(DISTINCT(p_partkey)) AS num
      FROM part, partsupp, supplier, nation
      WHERE n_name = 'CANADA'
            AND s_nationkey = n_nationkey
            AND s_suppkey = ps_suppkey 
            AND p_partkey = ps_partkey 
GROUP BY ps_partkey
HAVING COUNT(s_suppkey) > 1);