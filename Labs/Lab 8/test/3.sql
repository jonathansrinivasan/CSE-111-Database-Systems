.eqp on

select *
from lineitem
where l_returnflag = 'R' AND
    l_receiptdate = '1992-05-30';
