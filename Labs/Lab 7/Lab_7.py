import sqlite3
from sqlite3 import Error


def openConnection(_dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Open database: ", _dbFile)

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

    return conn

def closeConnection(_conn, _dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def createTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create table")

    try:
        sql = """CREATE TABLE warehouse (
                    w_warehousekey decimal(9,0) NOT NULL,
                    w_name char(100) NOT NULL,
                    w_capacity decimal(6,0) NOT NULL,
                    w_suppkey decimal(9,0) NOT NULL,
                    w_nationkey decimal(2,0) NOT NULL)"""
        _conn.execute(sql)

        _conn.commit()
        print("Table created successfullly")
    except Error as e:
        _conn.rollback()
        print(e)
	    
    print("++++++++++++++++++++++++++++++++++")


def dropTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Drop tables")

    try:
        sql = "DROP TABLE warehouse"
        _conn.execute(sql)

        print("Table dropped successfully")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

def helperNation(_conn, _suppKey):
    try:
        sql = """SELECT l_suppkey, n_name, n_nationkey, COUNT(*) AS num
                    FROM customer, orders, lineitem, nation
                    WHERE c_custkey = o_custkey 
                        AND c_nationkey = n_nationkey 
                        AND l_orderkey = o_orderkey 
                        AND l_suppkey = ? 
                    GROUP BY l_suppkey, c_nationkey
                    ORDER BY l_suppkey, num DESC, n_name
                    limit 2"""

        cur = _conn.cursor()
        cur.execute(sql, _suppKey)
        rows = cur.fetchall()

        return rows
    except Error as e:
        print(e)

def helperCapacity(_conn, _suppKey):
    try:
        sql = """SELECT MAX(sum)
                FROM (
                    (SELECT s_suppkey, n_name, n_nationkey, sum(p_size) AS sum
                        FROM customer, supplier, orders, lineitem, nation, part
                        WHERE c_custkey = o_custkey 
                            AND c_nationkey = n_nationkey
                            AND o_orderkey = l_orderkey 
                            AND l_suppkey = s_suppkey 
                            AND l_partkey = p_partkey 
                            AND l_suppkey = ? 
                        GROUP BY s_suppkey, c_nationkey) AS R
                    )
                    GROUP BY R.s_suppkey"""

        cur = _conn.cursor()
        cur.execute(sql, _suppKey)
        rows = cur.fetchall()

        return rows

    except Error as e:
        print(e)

def insertWarehouse(_conn, w_warehousekey, w_name, w_capacity, w_suppkey, w_nationkey):
    try:
        sql = """INSERT INTO warehouse(w_warehousekey, w_name, w_capacity, w_suppkey, w_nationkey) 
                    VALUES(?, ?, ?, ?, ?)"""

        args = [w_warehousekey, w_name, w_capacity, w_suppkey, w_nationkey]
        _conn.execute(sql, args)

    except Error as e:
        print(e)


def populateTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Populate table")
    
    try:
        sql = """SELECT s_suppkey, s_name
                    FROM supplier"""

        c = _conn.cursor()
        c.execute(sql)
        t = c.fetchall()

        warehousekey = 0

        for suppkey in t:
            capacity = helperCapacity(_conn, [suppkey[0]])
            nations = helperNation(_conn, [suppkey[0]])
            
            for nationkey in nations:
                name = suppkey[1] + "___" + nationkey[1]
                warehousekey += 1
                insertWarehouse(_conn, warehousekey, name, (capacity[0][0] * 2), suppkey[0], nationkey[2])
        
        print("Populated table successfully")
    except Error as e:
        print(e)
            
    print("++++++++++++++++++++++++++++++++++")

def helperWrite(_out, _res):  
    with open(_out, "w") as file:
        file.write(_res)

def helperRead(_in):
    with open(_in, "r") as file:
        info = file.readlines()

    getData = []
    for table in info:
        line = table.rstrip()

        if line:
            getData.append(line.rstrip())
    
    return getData

def Q1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q1")

    try:
        sql = """SELECT * 
                    FROM warehouse 
                    ORDER BY w_warehousekey"""

        cur = _conn.cursor()
        cur.execute(sql)

        l = "{:>10} {:<40} {:>10} {:>10} {:>10}\n".format("wId", "wName", "wCap", "sId", "nId")
        print(l)
        print("-------------------------------------------------------------------------------------")

        rows = cur.fetchall()
        for row in rows:
            l +="{:>10} {:<40} {:>10} {:>10} {:>10}\n".format(row[0], row[1], row[2], row[3], row[4])
        
        print(l)
        helperWrite("output/1.out", l)

        print("Q1 RAN")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q2")

    try:
        sql = """SELECT n_name, COUNT(w_warehousekey), SUM(w_capacity) AS cap
                    FROM warehouse, nation
                    WHERE n_nationkey = w_nationkey
                    GROUP BY w_nationkey
                    ORDER BY cap DESC, n_name"""

        cur = _conn.cursor()
        cur.execute(sql)

        l = "{:<40} {:>10} {:>10}\n".format("nation", "numW", "totCap")
        print(l)
        print("---------------------------------------------------------------")

        rows = cur.fetchall()

        for row in rows:
            l += "{:<40} {:>10} {:>10}\n".format(row[0], row[1], row[2])

        print(l)
        helperWrite("output/2.out", l)

        print("Q2 RAN")
    except Error as e:
        print(e)

    print("Q2 RAN")
    print("++++++++++++++++++++++++++++++++++")


def Q3(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q3")

    try:
        sql = """SELECT s_name, N2.n_name, w_name
                    FROM warehouse, nation AS N1, nation AS N2, supplier
                    WHERE N1.n_nationkey = w_nationkey   
                        AND w_suppkey = s_suppkey 
                        AND N2.n_nationkey = s_nationkey 
                        AND N1.n_name = ?
                    ORDER BY s_name"""

        args = helperRead("input/3.in")
    
        cur = _conn.cursor()
        cur.execute(sql, args)

        l = "{:>20} {:>20} {:>20}\n".format("supplier", "nation", "warehouse")

        print(l)
        print("-----------------------------------------------------------------------")

        rows = cur.fetchall()

        for row in rows:
            l += "{:>20} {:>20} {:>20}\n".format(row[0], row[1], row[2])
        
        print(l)
        helperWrite("output/3.out", l)

        print("Q3 RAN")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q4(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q4")

    try:
        sql = """SELECT w_name, w_capacity
                    FROM warehouse, nation, region
                    WHERE w_nationkey = n_nationkey 
                        AND n_regionkey = r_regionkey 
                        AND r_name = ? 
                        AND w_capacity >= ?
                    ORDER BY w_capacity DESC"""

        args = helperRead("input/4.in")

        cur = _conn.cursor()
        cur.execute(sql, args)

        l = "{:<40} {:>20}\n".format("warehouse", "capacity")
        print(l)
        print("--------------------------------------------------------------")

        rows = cur.fetchall()

        for row in rows:
            l += "{:<40} {:>20}\n".format(row[0], row[1])

        print(l)

        helperWrite("output/4.out", l)

        print("Q4 RAN")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q5")

    try:
        sql = """SELECT R.r_name, 
                CASE
                    WHEN F.total_capacity is NULL then 0
                        ELSE F.total_capacity
                end as total
                FROM (
                    region AS R
                    LEFT JOIN
                    (SELECT r_name, SUM(w_capacity) AS total_capacity
                        FROM warehouse, nation AS N1, nation AS N2, region, supplier
                        WHERE N1.n_nationkey = s_nationkey 
                            AND N2.n_regionkey = r_regionkey 
                            AND N2.n_nationkey = w_nationkey 
                            AND s_suppkey = w_suppkey 
                            AND N1.n_name = ?
                        GROUP BY r_name) AS F
                        ON R.r_name = F.r_name)
                ORDER BY R.r_name"""

        args = helperRead("input/5.in")
    
        cur = _conn.cursor()
        cur.execute(sql, args)

        l = "{:<20} {:>20}\n".format("region", "capacity")
        print(l)
        print("--------------------------------------------------")

        rows = cur.fetchall()

        for row in rows:
            l += "{:<20} {:>20}\n".format(row[0], row[1])

        print(l)
        helperWrite("output/5.out", l)

    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"data/tpch.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        dropTable(conn)
        createTable(conn)
        populateTable(conn)

        Q1(conn)
        Q2(conn)
        Q3(conn)
        Q4(conn)
        Q5(conn)

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
