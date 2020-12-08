.eqp on

SELECT o_custkey, COUNT(*)
from lineitem, orders
where l_discount >= 0.05 AND
    l_orderkey = o_orderkey
group by o_custkey
having count(*) >= 70;
