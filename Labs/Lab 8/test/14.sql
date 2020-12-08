.eqp on

select count(*)
from customer, nation, orders
where c_nationkey = n_nationkey AND
    c_custkey = o_custkey AND
    o_orderpriority = '1-URGENT' AND
    n_name = 'FRANCE' AND
    (o_orderdate like '1994-__-__' or
    o_orderdate like '1995-__-__' or
    o_orderdate like '1996-__-__');
