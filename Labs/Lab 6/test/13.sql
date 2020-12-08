SELECT n_name
FROM lineitem, (SELECT n_name, SUM(l_extendedprice)
                FROM nation, lineitem, supplier
                WHERE s_suppkey = l_suppkey
                      AND s_nationkey = n_nationkey)
WHERE l_shipdate LIKE '%1996%'
GROUP BY n_name;