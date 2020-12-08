SELECT MAX(l_discount)
FROM(SELECT *
    FROM lineitem, orders
    WHERE l_orderkey = o_orderkey 
        AND o_orderdate <= '1995-05-31'
        AND o_orderdate >= '1995-05-01' ), 
            (SELECT AVG(l_discount) as average
            FROM lineitem, orders
            WHERE l_orderkey = o_orderkey 
                AND o_orderdate <= '1995-05-31'
                AND o_orderdate >= '1995-05-01' 
                )
                WHERE l_discount < average;