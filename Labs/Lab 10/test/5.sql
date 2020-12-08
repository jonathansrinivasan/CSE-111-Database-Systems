CREATE TRIGGER t5 after delete on part for each ROW
BEGIN
    DELETE FROM partsupp
    WHERE ps_partkey = old.p_partkey;
    DELETE FROM lineitem
    WHERE l_partkey = old.p_partkey;
END;

DELETE FROM part
WHERE p_partkey IN (SELECT ps_partkey
                    FROM partsupp,supplier,nation
                    WHERE s_suppkey = ps_suppkey
                        AND n_nationkey = s_nationkey
                        AND n_name IN ('FRANCE','GERMANY'));

SELECT n_name, COUNT(ps_suppkey)
FROM partsupp, supplier, nation, region
WHERE s_suppkey = ps_suppkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'EUROPE'
GROUP BY n_name;