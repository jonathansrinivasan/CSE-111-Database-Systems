.eqp on

select sum(o_totalprice)
from orders, customer, nation, region
where r_name = 'EUROPE' AND
	r_regionkey = n_regionkey AND
	n_nationkey = c_nationkey AND
	c_custkey = o_custkey AND
	o_orderdate like '1996-__-__';
