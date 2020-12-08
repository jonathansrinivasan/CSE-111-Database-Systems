--EQP-- 0,0,2,SEARCH TABLE orders USING INDEX orders_idx_o_orderpriority_o_orderkey (o_orderpriority=?)
--EQP-- 0,1,1,SEARCH TABLE nation USING COVERING INDEX nation_idx_n_name_n_nationkey (n_name=?)
--EQP-- 0,2,0,SEARCH TABLE customer USING COVERING INDEX customer_idx_c_nationkey_c_custkey (c_nationkey=? AND c_custkey=?)
35
