SELECT p_type, AVG(l_discount) 
FROM lineitem, part 
WHERE l_partkey = p_partkey 
      AND p_type LIKE '%PROMO%' 
      GROUP BY p_type 
      ORDER BY p_type;