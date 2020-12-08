SELECT COUNT(c_name)
FROM customer, region, nation
WHERE n_nationkey = c_nationkey
    AND n_regionkey = r_regionkey 
    AND r_name <> 'AFRICA' 
    AND r_name <> 'EUROPE'; 