--1
CREATE INDEX customer_idx_c_name ON customer(c_name);

--2
CREATE INDEX supplier_idx_s_acctbal ON supplier(s_acctbal DESC);

--3
CREATE INDEX lineitem_idx_l_returnflag_l_receiptdate ON lineitem(l_returnflag, l_receiptdate);

--5
CREATE INDEX customer_idx_c_mktsegment ON customer(c_mktsegment);

--6
CREATE INDEX orders_idx_o_orderdate ON orders(o_orderdate);
CREATE INDEX customer_idx_c_custkey ON customer(c_custkey);
CREATE INDEX nation_idx_n_nationkey ON nation(n_nationkey);

--11
CREATE INDEX lineitem_idx_l_orderkey_l_discount ON lineitem(l_orderkey, l_discount);

--7
CREATE INDEX lineitem_idx_l_orderkey_l_receiptdate ON lineitem(l_orderkey, l_receiptdate);
CREATE INDEX orders_idx_o_custkey_o_orderkey ON orders(o_custkey, o_orderkey);
CREATE INDEX customer_idx_c_name_c_custkey ON customer(c_name, c_custkey);

--8
CREATE INDEX supplier_idx_s_nationkey_s_acctbal ON supplier(s_nationkey, s_acctbal);
CREATE INDEX nation_idx_n_regionkey_n_nationkey ON nation(n_regionkey, n_nationkey);
CREATE INDEX region_idx_r_name_r_regionkey ON region(r_name, r_regionkey);

--9
CREATE INDEX nation_idx_n_name ON nation(n_name);

--10
CREATE INDEX customer_idx_c_nationkey ON customer(c_nationkey);

--12
CREATE INDEX region_idx_r_regionkey_r_name ON region(r_regionkey, r_name);
CREATE INDEX orders_idx_o_orderstatus ON orders(o_orderstatus);

--13


--14
CREATE INDEX customer_idx_c_nationkey_c_custkey ON customer(c_nationkey, c_custkey);
CREATE INDEX nation_idx_n_name_n_nationkey ON nation(n_name, n_nationkey);
CREATE INDEX orders_idx_o_orderpriority_o_custkey ON orders(o_orderpriority, o_custkey);

--15
CREATE INDEX supplier_idx_s_suppkey ON supplier(s_suppkey);
CREATE INDEX orders_idx_o_orderpriority_o_orderkey ON orders(o_orderpriority, o_orderkey);


