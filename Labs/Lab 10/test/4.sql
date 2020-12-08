CREATE TRIGGER tinsert after insert on lineitem for each ROW
BEGIN 
    UPDATE orders
    SET o_orderpriority = 'HIGH'
    WHERE o_orderkey = new.l_orderkey;
END;

CREATE TRIGGER tdelete after delete on lineitem for each ROW
BEGIN 
    UPDATE orders
    SET o_orderpriority = 'HIGH'
    WHERE o_orderkey = old.l_orderkey;
END;

DELETE FROM lineitem
WHERE l_orderkey IN (SELECT o_orderkey 
                        FROM orders 
                        WHERE o_orderdate LIKE '1996-11-__');

SELECT COUNT(*)
FROM orders
WHERE o_orderpriority = 'HIGH'
    AND o_orderdate LIKE '1996-11-__';