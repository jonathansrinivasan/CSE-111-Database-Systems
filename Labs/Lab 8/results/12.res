--EQP-- 0,0,0,SEARCH TABLE orders USING INDEX orders_idx_o_orderstatus (o_orderstatus=?)
--EQP-- 0,1,1,SEARCH TABLE customer USING INDEX customer_idx_c_custkey (c_custkey=?)
--EQP-- 0,2,2,SEARCH TABLE nation USING INDEX nation_idx_n_nationkey (n_nationkey=?)
--EQP-- 0,3,3,SEARCH TABLE region USING COVERING INDEX region_idx_r_regionkey_r_name (r_regionkey=?)
--EQP-- 0,0,0,USE TEMP B-TREE FOR GROUP BY
--EQP-- 0,0,0,USE TEMP B-TREE FOR ORDER BY
MIDDLE EAST|1629
AFRICA|1503
AMERICA|1425
ASIA|1423
EUROPE|1324
