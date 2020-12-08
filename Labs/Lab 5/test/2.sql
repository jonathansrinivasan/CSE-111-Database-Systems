SELECT r_name, COUNT(s_acctbal)
FROM (SELECT r_name AS region_name, AVG(s_acctbal) AS avg_acctbal
    FROM region, nation, supplier
    WHERE r_regionkey = n_regionkey 
        AND s_nationkey = n_nationkey 
        GROUP BY r_name), region , supplier , nation
WHERE r_name = region_name
    AND n_nationkey = s_nationkey
    AND n_regionkey = r_regionkey
    AND avg_acctbal < s_acctbal
    GROUP BY r_name;