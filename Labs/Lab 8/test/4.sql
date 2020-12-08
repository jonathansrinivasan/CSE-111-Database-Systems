.eqp on

select
    avg(julianday(l_shipdate) - julianday(l_commitdate))
from lineitem
where l_shipdate >= l_commitdate;
