.eqp on

select n_name, min(s_acctbal)
from supplier, nation
where s_nationkey = n_nationkey
group by n_name
having count(*) < 3;
