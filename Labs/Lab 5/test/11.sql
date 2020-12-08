SELECT p_name
FROM(SELECT p_name, MAX(l_extendedprice * (1 - l_discount))
    FROM part, lineitem
    WHERE l_shipdate > '1994-10-02'
      AND p_partkey = l_partkey);