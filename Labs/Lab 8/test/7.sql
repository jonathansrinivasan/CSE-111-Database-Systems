.eqp on

SELECT l_receiptdate, count(*) as no_items
from orders, customer, lineitem
where o_custkey = c_custkey AND
	o_orderkey = l_orderkey AND
	c_name = 'Customer#000000106'
group by l_receiptdate;
