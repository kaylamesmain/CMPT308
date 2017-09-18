//Kayla Mesmain 
//Lab 3
//09/18/17

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



-- Question number 1 
SELECT ordno, totalUSD
FROM orders;

-- Question number 2
SELECT name, city
FROM Agents
WHERE name= 'Smith';

--Question number 3 
SELECT pid, name, priceUSD 
FROM Products 
WHERE qty > 200010;

--Question number 4
SELECT name, city 
FROM Customers 
WHERE city= 'Duluth'

--Question number 5
SELECT name, city 
FROM Agents  
WHERE city != 'New York' 
AND city != 'Duluth'; 

--Question number 6
SELECT pid, name, city, qty, priceUSD 
FROM Products 
WHERE city != 'Dallas' 
AND city != 'Duluth' 
AND priceUSD >= 1.00;

--Question number 7 
SELECT *
FROM orders
WHERE month = 'Mar' 
OR month = 'May';

--Question number 8 
SELECT * 
FROM orders 
WHERE month = 'Feb' 
AND totalUSD >= 500.00; 

--Question number 9 
SELECT *
FROM orders 
WHERE cid = 'C005';