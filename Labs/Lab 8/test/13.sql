.eqp on

select avg(c_acctbal)
from customer, nation, region
where c_nationkey = n_nationkey and
    n_regionkey = r_regionkey and
    r_name = 'AFRICA' AND
    c_mktsegment = 'MACHINERY';
