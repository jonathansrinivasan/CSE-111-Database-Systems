SELECT DISTINCT c_nation, sum_customers, sum_suppliers 
FROM (SELECT COUNT(c_custkey) AS sum_customers, n_name AS c_nation, r_name, c_custkey
      FROM customer, nation, region 
      WHERE r_regionkey = n_regionkey
            AND r_name = 'EUROPE' 
            AND c_nationkey = n_nationkey 
            GROUP BY n_name), (SELECT COUNT(s_suppkey) AS sum_suppliers, n_name AS s_nation, r_name 
                               FROM supplier, region, nation 
                               WHERE n_regionkey = r_regionkey 
                                    AND r_name = 'EUROPE' 
                                    AND n_nationkey = s_nationkey 
                                    GROUP BY n_name), nation 
WHERE c_nation = s_nation;