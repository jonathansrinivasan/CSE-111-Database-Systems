SELECT n_name, MIN(s_acctbal)
FROM supplier, nation
WHERE s_nationkey = n_nationkey
GROUP BY s_nationkey
HAVING COUNT(s_nationkey) < 3