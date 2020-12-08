--EQP-- 0,0,0,SEARCH TABLE customer USING INDEX customer_idx_c_mktsegment (c_mktsegment=?)
--EQP-- 0,1,2,SEARCH TABLE region USING COVERING INDEX region_idx_r_name_r_regionkey (r_name=?)
--EQP-- 0,2,1,SEARCH TABLE nation USING COVERING INDEX nation_idx_n_regionkey_n_nationkey (n_regionkey=? AND n_nationkey=?)
4208.73392857143
