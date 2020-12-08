SELECT s_name
FROM supplier, nation
WHERE (s_nationkey = n_nationkey) AND (n_regionkey = 2) AND (s_acctbal < 1000)
