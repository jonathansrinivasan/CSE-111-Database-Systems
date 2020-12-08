SELECT COUNT(num)
FROM (SELECT COUNT(DISTINCT(s_suppkey)) AS num
      FROM part, partsupp, supplier, nation
      WHERE n_name = 'CANADA'
            AND n_nationkey = s_nationkey
            AND ps_suppkey = s_suppkey
            AND p_partkey = ps_partkey 
            GROUP BY s_suppkey
            HAVING COUNT(p_partkey) >= 4);