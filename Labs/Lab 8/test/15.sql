.eqp on

select substr(o_orderdate, 1, 4) as year,
    r_name, count(*)
from orders, lineitem, supplier, nation, region
where o_orderpriority = '1-URGENT' AND
    o_orderkey = l_orderkey AND
    l_suppkey = s_suppkey AND
    s_nationkey = n_nationkey AND
    n_regionkey = r_regionkey
group by year, r_name
order by year, r_name;
