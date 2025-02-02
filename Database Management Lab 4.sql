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

SELECT city 
FROM Agents 
WHERE aid in ( SELECT aid 
		FROM Orders
		WHERE cid = 'c006'
		);
--Question 2

SELECT DISTINCT pid 
FROM Orders 
WHERE aid in (SELECT aid 
		from orders 
		where cid in (SELECT cid
				FROM customers 
				WHERE city = 'Beijing')
		); 

--Question 3
SELECT name, cid 
FROM customers 
WHERE cid in ( SELECT cid
		FROM orders 
		WHERE aid != 'a03' 
		); 
--Question 4
SELECT DISTINCT cid 
FROM orders
WHERE pid= 'p01' 
AND cid in ( SELECT cid 
		FROM orders 
		WHERE pid = 'p07'
		); 
--Question 5
SELECT DISTINCT pid 
FROM orders 
WHERE cid NOT in (SELECT cid 
		FROM orders 
		WHERE aid = 'a02'
		OR aid ='a03')
		ORDER BY pid DESC
		
--Question 6
SELECT name, discountPct, city
FROM Customers
WHERE cid in (SELECT cid 
		FROM orders 
		WHERE aid in (SELECT aid 
				FROM agents
				WHERE city in ('Tokyo', 'New York')));


--Question 7

SELECT *
FROM Customers 
WHERE discountPct in (SELECT discountPtc
			FROM customers 
			WHERE city in ('Duluth','London')); 

--Question 8
--Check Constraints are used when an individual is writing a quire that is limited to a certain value. The constraint is limited to the specifics constraints that are only based on true statements. This is very similar to Boolean of true and false because, when false the values will not appear in the columns. This is good because for example in class we wanted to limit the certain amount of people that exceeded over the amount of 18 people. This allows individuals to be more specific when using queries in database. A good example of check constraints are an example of listing greater than or equal to an amount of people that have spent over the max amount on their budget. This will list the specific people that are over budget amount.  Check constraints also prevents duplicates for example people of the same name. An example of a bad check constraint would be limiting a value that has the same thing for all the columns in the table. For example, if there is a quire that is limited to only people that do not live in New York but everyone lives in New York then this will cause a problem. The check constraint is important when you are trying to prove specific constraints on queries. 
