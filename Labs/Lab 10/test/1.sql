CREATE TRIGGER t1 AFTER insert on orders for each ROW
BEGIN
    UPDATE orders 
    SET o_orderdate = '2020-12-01'
    WHERE orderkey = new.o_orderkey;
END;

SELECT COUNT(*) 
FROM orders 
WHERE o_orderdate LIKE '2020-__-__';