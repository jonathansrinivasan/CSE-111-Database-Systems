.eqp on

SELECT s_name
from supplier, nation, region
where s_acctbal < 1000 AND
    s_nationkey = n_nationkey AND
    n_regionkey = r_regionkey AND
    r_name = 'ASIA';
