SELECT COUNT(DISTINCT(s_suppkey)) 
FROM partsupp, part, supplier
WHERE s_suppkey = ps_suppkey
      AND p_partkey = ps_partkey
      AND p_retailprice = (SELECT MIN(p_retailprice)
                           FROM part);