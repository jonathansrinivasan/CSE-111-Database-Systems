.eqp on

select distinct n_name
from customer, nation, orders
where o_orderdate >= '1995-03-10' AND
	o_orderdate <= '1995-03-12' and
	o_custkey = c_custkey and
	c_nationkey = n_nationkey;
