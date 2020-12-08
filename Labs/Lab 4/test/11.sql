SELECT n_name, s_name, max(s_acctbal)
FROM region, nation, supplier
WHERE r_regionkey = n_regionkey 
    AND n_nationkey = s_nationkey
GROUP BY n_name
HAVING max(s_acctbal)
