SELECT COUNT(*)
FROM supplier, nation, partsupp
WHERE n_name = 'CANADA' 
      AND n_nationkey = s_nationkey 
      AND ps_suppkey = s_suppkey 
      AND ps_supplycost * ps_availqty IN (SELECT ps_supplycost * ps_availqty 
                                          FROM partsupp
                                          ORDER BY ps_supplycost * ps_availqty 
                                          DESC LIMIT (SELECT COUNT(*) * 0.03  
                                          FROM partsupp));