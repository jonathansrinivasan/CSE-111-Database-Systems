SELECT s_name, c_name
FROM supplier,orders, lineitem, customer
WHERE c_custkey = o_custkey
      AND l_suppkey = s_suppkey
      AND o_orderkey = l_orderkey
      AND o_orderstatus = 'F'
      AND o_totalprice = (SELECT MAX(o_totalprice)
                          FROM orders
                          WHERE o_orderstatus = 'F');
