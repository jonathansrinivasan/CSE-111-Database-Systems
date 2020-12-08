SELECT n_name, AVG(s_acctbal)
FROM supplier, nation, region
WHERE s_nationkey = n_nationkey
      AND n_regionkey = r_regionkey
      GROUP BY n_name;
