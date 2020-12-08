SELECT five.n_name, (five.p - four.p), (six.p - five.p)
FROM (
    (SELECT A.n_name, (b-a) as p
    FROM ((SELECT c_nationkey, n_name, count(*) as a
            FROM ((SELECT s_nationkey, c_nationkey, n_name
                FROM supplier, customer, orders, lineitem, nation
                WHERE s_suppkey = l_suppkey
                    AND l_orderkey = o_orderkey
                    AND c_custkey = o_custkey
                    AND c_nationkey = n_nationkey
                    AND strftime("%Y", l_shipdate) = "1996")
            )
    WHERE s_nationkey <> c_nationkey
    GROUP BY c_nationkey) A,

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
    )
    WHERE A.c_nationkey = B.s_nationkey) six,

    (SELECT A.n_name, (b-a) as p
    FROM ((SELECT c_nationkey, n_name, count(*) as a
            FROM ((SELECT s_nationkey, c_nationkey, n_name
            FROM supplier, customer, orders, lineitem, nation
            WHERE s_suppkey = l_suppkey
                AND l_orderkey = o_orderkey
                AND c_custkey = o_custkey
                AND c_nationkey = n_nationkey
                AND strftime("%Y", l_shipdate) = "1995")
            )
    WHERE s_nationkey <> c_nationkey
    GROUP BY c_nationkey) A,

    (SELECT s_nationkey, count(*) as b
    FROM (
        (SELECT s_nationkey, c_nationkey
        FROM supplier, customer, orders, lineitem
        WHERE s_suppkey = l_suppkey
            AND l_orderkey = o_orderkey
            AND c_custkey = o_custkey
            AND strftime("%Y", l_shipdate) = "1995")
    )
    WHERE s_nationkey <> c_nationkey
    GROUP BY s_nationkey) B
    )
    WHERE A.c_nationkey = B.s_nationkey) five,

(SELECT A.n_name, (b-a) as p
    FROM ((SELECT c_nationkey, n_name, count(*) as a
            FROM ((SELECT s_nationkey, c_nationkey, n_name
            FROM supplier, customer, orders, lineitem, nation
            WHERE s_suppkey = l_suppkey
                AND l_orderkey = o_orderkey
                AND c_custkey = o_custkey
                AND c_nationkey = n_nationkey
                AND strftime("%Y", l_shipdate) = "1994")
            )
    WHERE s_nationkey <> c_nationkey
    GROUP BY c_nationkey) A,

    (SELECT s_nationkey, count(*) as b
    FROM (
        (SELECT s_nationkey, c_nationkey
        FROM supplier, customer, orders, lineitem
        WHERE s_suppkey = l_suppkey
            AND l_orderkey = o_orderkey
            AND c_custkey = o_custkey
            AND strftime("%Y", l_shipdate) = "1994")
    )
    WHERE s_nationkey <> c_nationkey
    GROUP BY s_nationkey) B
    )
    WHERE A.c_nationkey = B.s_nationkey) four
)
WHERE four.n_name = five.n_name
    AND five.n_name = six.n_name
ORDER BY four.n_name