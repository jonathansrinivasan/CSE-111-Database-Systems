SELECT n_name
FROM (SELECT n_name, MAX(biggest)
      FROM (SELECT n_name, SUM(o_totalprice) AS biggest
            FROM nation, orders, customer
            WHERE c_custkey = o_custkey
                AND c_nationkey = n_nationkey
             GROUP BY n_name));