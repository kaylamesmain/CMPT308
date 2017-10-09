----------------------------------------------------------------------------------------
-- Postgres create, load, and query script for CAP5.
--
-- SQL statements for the CAP database
-- 
-- Derived from the CAP examples in _Database Principles, Programming, and Performance_, 
--   Second Edition by Patrick O'Neil and Elizabeth O'Neil
-- 
-- Modified several many by Alan G. Labouseur
-- 
-- Tested on Postgres 9.3.2    (For earlier versions, you may need
--   to remove the "if exists" clause from the DROP TABLE commands.)
----------------------------------------------------------------------------------------

-- Connect to your Postgres server and set the active database to CAP ("\connect CAP" in psql). Then ...

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Agents;
DROP TABLE IF EXISTS Products;


-- Customers --
CREATE TABLE Customers (
  cid         char(4) not null,
  name        text,
  city        text,
  discountPct decimal(5,2),
 primary key(cid)
);


-- Agents --
CREATE TABLE Agents (
  aid        char(3) not null,
  name       text,
  city       text,
  commission decimal(5,2),
 primary key(aid)
);        


-- Products --
CREATE TABLE Products (
  pid      char(3) not null,
  name     text,
  city     text,
  qty      integer,
  priceUSD numeric(10,2),
 primary key(pid)
);


-- Orders -- 
CREATE TABLE Orders (
  ordNo    integer not null,
  month    char(3),    
  cid      char(4) not null references customers(cid),
  aid      char(3) not null references agents(aid),
  pid      char(3) not null references products(pid),
  quantity integer,
  totalUSD numeric(12,2),
 primary key(ordNo)
);



-- SQL statements for loading example data 

-- Customers --
INSERT INTO Customers( cid, name, city, discountPct )
  VALUES('c001', 'Tiptop', 'Duluth', 10.00);

INSERT INTO Customers( cid, name, city, discountPct )
  VALUES('c002', 'Tyrell', 'Dallas', 12.00);

INSERT INTO Customers( cid, name, city, discountPct )
  VALUES('c003', 'Eldon', 'Dallas', 8.00);

INSERT INTO Customers( cid, name, city, discountPct )
  VALUES('c004' ,'ACME' ,'Duluth', 8.50);

INSERT INTO Customers( cid, name, city, discountPct )
  VALUES('c005' ,'Weyland', 'Risa', 0.00);

INSERT INTO Customers( cid, name, city, discountPct )
  VALUES('c006' ,'ACME' ,'Beijing' ,0.00);


-- Agents --
INSERT INTO Agents( aid, name, city, commission )
VALUES('a01', 'Smith', 'New York', 5.60 ),
      ('a02', 'Jones', 'Newark', 6.00 ),
      ('a03', 'Perry', 'Hong Kong', 7.00 ),
      ('a04', 'Gray', 'New York', 6.00 ),
      ('a05', 'Otasi', 'Duluth', 5.00 ),
      ('a06', 'Smith', 'Dallas', 5.00 ),
      ('a08', 'Bond', 'London', 7.07 );


-- Products --
INSERT INTO Products( pid, name, city, qty, priceUSD )
  VALUES('p01', 'Heisenberg compensator', 'Dallas', 111400, 0.50 );

INSERT INTO Products( pid, name, city, qty, priceUSD )
  VALUES('p02', 'universal translator', 'Newark', 203000, 0.50 );

INSERT INTO Products( pid, name, city, qty, priceUSD )
  VALUES('p03', 'Commodore PET', 'Duluth', 150600, 1.00 );

INSERT INTO Products( pid, name, city, qty, priceUSD )
  VALUES('p04', 'LCARS module', 'Duluth', 125300, 1.00 );

INSERT INTO Products( pid, name, city, qty, priceUSD )
  VALUES('p05', 'pencil', 'Dallas', 221400, 1.00 );

INSERT INTO Products( pid, name, city, qty, priceUSD )
  VALUES('p06', 'trapper keeper','Dallas', 123100, 2.00 );

INSERT INTO Products( pid, name, city, qty, priceUSD )
  VALUES('p07', 'flux capacitor', 'Newark', 100500, 1.00 );

INSERT INTO Products( pid, name, city, qty, priceUSD )
  VALUES('p08', 'HAL 9000 memory core', 'Newark', 200600, 1.25 );


-- Orders --
INSERT INTO Orders( ordNo, month, cid, aid, pid, quantity, totalUSD )
VALUES(1011, 'Jan', 'c001', 'a01', 'p01', 1100,  495.00),
      (1012, 'Jan', 'c002', 'a03', 'p03', 1200, 1056.00),
      (1015, 'Jan', 'c003', 'a03', 'p05', 1000,  920.00),
      (1016, 'Jan', 'c006', 'a01', 'p01', 1000,  500.00),
      (1017, 'Feb', 'c001', 'a06', 'p03',  500,  540.00),
      (1018, 'Feb', 'c001', 'a03', 'p04',  600,  540.00),
      (1019, 'Feb', 'c001', 'a02', 'p02',  400,  180.00),
      (1020, 'Feb', 'c006', 'a03', 'p07',  600,  600.00),
      (1021, 'Feb', 'c004', 'a06', 'p01', 1000,  457.50),
      (1022, 'Mar', 'c001', 'a05', 'p06',  450,  810.00),
      (1023, 'Mar', 'c001', 'a04', 'p05',  500,  450.00),
      (1024, 'Mar', 'c006', 'a06', 'p01',  880,  400.00),
      (1025, 'Apr', 'c001', 'a05', 'p07',  888,  799.20),
      (1026, 'May', 'c002', 'a05', 'p03',  808,  711.04);


-- SQL statements for displaying the example data

select *
from Customers;

select *
from Agents;

select *
from Products;

select *
from Orders;

--Question 1 
--Show the cities of agents booking an order for a customer whose id is 'c006'. Use joins this time; no subqueries.
SELECT city 
FROM agents
INNER JOIN orders ON orders.aid = agents.aid
WHERE orders.cid = 'c006';

--Question 2 
--Show the ids of products ordered through any agent who makes at least one order for a customer in Beijing, sorted by pid from highest to lowest. Use joins; no subqueries.
SELECT products.pid
FROM products
INNER JOIN orders ON products.pid = orders.pid
INNER JOIN customers ON orders.cid = customers.cid
WHERE customers.city = 'Beijing';

--Question 3 
--Show the names of customers who have never placed an order. Use a subquery.

SELECT name
FROM customers 
WHERE customers.cid NOT IN (SELECT orders.cid
				FROM orders);

--Question 4 
--Show the names of customers who have never placed an order. Use an outer join.
SELECT name 
FROM customers 
LEFT JOIN orders ON customers.cid = orders.cid
WHERE orders.cid is NULL;

--Question 5 
--Show the names of customers who placed at least one order through an agent in their own city, along with those agent(s') names.
SELECT DISTINCT customers.name 
FROM customers
INNER JOIN orders ON customers.cid = orders.cid 
INNER JOIN agents ON agents.aid = orders.aid 
AND customers.city = agents.city;

--Question 6 
--Show the names of customers and agents living in the same city, along with the name of the shared city, regardless of whether or not the customer has ever placed an order with that agent.
SELECT customers.name AS "Customer",
agents.name AS "Agent",
agents.city AS "Cities both are in"
FROM customers 
INNER JOIN agents ON customers.city = agents.city;

--Question 7 
--Show the name and city of customers who live in the city that makes the fewest different kinds of products. (Hint: Use count and group by on the Products table.)
SELECT name, city
FROM customers
WHERE city IN (SELECT city
                FROM products
                GROUP BY city
                ORDER BY COUNT(*) ASC
                LIMIT 1
              );