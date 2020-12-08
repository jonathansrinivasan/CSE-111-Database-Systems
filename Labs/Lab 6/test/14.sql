SELECT A.n_name, (b-a) as p
FROM (SELECT c_nationkey, n_name, count(*) as a
    FROM (SELECT s_nationkey, c_nationkey, n_name
            FROM supplier, customer, orders, lineitem, nation
            WHERE s_suppkey = l_suppkey
                  AND l_orderkey = o_orderkey
                  AND c_custkey = o_custkey
                  AND c_nationkey = n_nationkey
                  AND strftime("%Y", l_shipdate) = "1996")
    WHERE s_nationkey <> c_nationkey
    group by c_nationkey) A,

    (SELECT s_nationkey, count(*) as b
    FROM (
        (SELECT s_nationkey, c_nationkey
        FROM supplier, customer, orders, lineitem
        WHERE s_suppkey = l_suppkey
            AND l_orderkey = o_orderkey
            AND c_custkey = o_custkey
            AND strftime("%Y", l_shipdate) = "1996")
    )
    WHERE s_nationkey <> c_nationkey
    GROUP BY s_nationkey) B
    WHERE A.c_nationkey = B.s_nationkey
    ORDER BY p DESC