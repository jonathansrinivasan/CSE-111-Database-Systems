SELECT sum(NEQ.ps_supplycost)
FROM ((SELECT *
        FROM (partsupp,
        (SELECT p_partkey, l_suppkey
        FROM lineitem, part
        WHERE p_partkey = l_partkey 
            AND p_retailprice < 1000 
            AND strftime("%Y", l_shipdate) = "1996") NEQ)
        WHERE ps_suppkey = NEQ.l_suppkey 
            AND NEQ.p_partkey = ps_partkey) NEQ)
WHERE NEQ.l_suppkey NOT IN (SELECT DISTINCT s_suppkey
                            FROM supplier, lineitem 
                            WHERE s_suppkey = l_suppkey 
                                AND l_extendedprice < 2000 
                                AND strftime("%Y", l_shipdate) = "1995");