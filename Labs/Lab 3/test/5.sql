select c_mktsegment,
    min(c_acctbal),
    max(c_acctbal),
    avg(c_acctbal),
    sum(c_acctbal)
FROM customer
GROUP BY c_mktsegment
ORDER BY sum(c_acctbal) DESC