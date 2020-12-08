DROP trigger t3;
CREATE TRIGGER t3 after update on customer for each ROW
WHEN (new.c_acctbal > 0)
BEGIN
    UPDATE customer
    SET c_comment = 'Positive balance'
    WHERE c_acctbal = new.c_acctbal;
END;

UPDATE customer
SET c_acctbal = 100
WHERE c_nationkey IN (SELECT n_nationkey 
                        FROM nation 
                        WHERE n_name = 'ROMANIA');

SELECT COUNT(*) 
FROM customer, nation, region 
WHERE c_acctbal < 0 
    AND n_regionkey = r_regionkey
    AND c_nationkey = n_nationkey 
    AND r_name = 'EUROPE';