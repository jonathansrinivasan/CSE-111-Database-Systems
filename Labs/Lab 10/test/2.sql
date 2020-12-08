CREATE TRIGGER t2 after update on customer for each ROW
WHEN (new.c_acctbal < 0)
BEGIN
    UPDATE customer
    SET c_comment = 'Negative balance!!!'
    WHERE c_acctbal = new.c_acctbal;
END;

UPDATE customer
SET c_acctbal = -100
WHERE c_nationkey IN (SELECT n_nationkey 
                        FROM nation, region 
                        WHERE n_regionkey = r_regionkey 
                            AND r_name = 'EUROPE');

SELECT COUNT(*) 
FROM customer, nation 
WHERE c_acctbal < 0 
    AND c_nationkey = n_nationkey 
    AND n_name = 'FRANCE';