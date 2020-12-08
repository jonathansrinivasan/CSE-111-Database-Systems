SELECT n_name
FROM customer, nation
WHERE c_nationkey = n_nationkey
GROUP BY n_name HAVING COUNT(*) = (SELECT MAX(largeCust)
                                   FROM (SELECT COUNT(c_custkey) AS largeCust
                                         FROM customer, nation
                                         WHERE c_nationkey = n_nationkey
                                         GROUP BY n_name));