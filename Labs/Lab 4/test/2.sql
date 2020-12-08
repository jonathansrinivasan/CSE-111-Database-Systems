SELECT n_name, COUNT(s_nationkey)
FROM supplier, nation
WHERE n_nationkey = s_nationkey
GROUP BY s_nationkey
ORDER BY n_name;
