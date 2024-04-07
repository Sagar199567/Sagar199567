create database Order_Stores_Data
Create table Orderss_Table (order_date date, region varchar(25), rep varchar(25),Order_Item varchar(25), units int, units_cost int, total_price int, Order_ID int)
Create table Storess_table(Store_Id int,StoreType varchar(25), Assortment int, CompetitionDistance int, Month int, year int, promotnterval varchar(25) foreign Key (Order_ID) references (Orderss_Table))
 
INSERT INTO Orderss_Table values ('1-6-21','East', 'Aruna', 'Pencil', 95, 1.99, 189.05, 1)
INSERT INTO Orderss_Table values ('1-23-21','Central', 'Kivell', 'Eraser', 50, 19.99, 999.50, 2)
INSERT INTO Orderss_Table values ('2-9-21','Central', 'Ganesh', NULL, 36, 4.99, 179.64, 3)
INSERT INTO Orderss_Table values ('2-26-21','Central', 'Payal', NULL, 27, 19.99, 539.73, 4)
INSERT INTO Orderss_Table values ('3-15-21','West', 'Sorvino', NULL, 56, 2.99, 167.44, 5)
INSERT INTO Orderss_Table values ('4-1-21','East', 'Hitesh', 'Pencil', 60, 4.99, 299.40, 6)
INSERT INTO Orderss_Table values ('4-18-21','Central', 'Akshita', NULL, 75, 1.99, 149.25, 7)
INSERT INTO Orderss_Table values ('5-5-21','Central', 'Ruchika', 'Books', 90, 4.99, 449.10, 8)
INSERT INTO Orderss_Table values ('5-22-21','West', 'Surbhi', NULL, 32, 1.99, 63.68, 9)
INSERT INTO Orderss_Table values ('6-8-21','East', 'Jones', 'Suitcase', 60, 8.99, 539.40, 10);

select * from storess_table

Insert into Storess_table values(1, 'c', 40, 1270, 9, 2008, 'Jan')
Insert into Storess_table values(2, 'a', 13, 570, 11, 2007, 'Feb')
Insert into Storess_table values(3, 'a', 27, 14130, 12, 2006, 'Mar')
Insert into Storess_table values(4, 'c', 29, 620, 9, 2009, NULL)
Insert into Storess_table values(5, 'a', 19, 29910, 4, 2015, 'May')
Insert into Storess_table values(6, 'a', 39, 310, 12, 2013, 'June')
Insert into Storess_table values(7, 'a', 47, 24000, 4, 2013, NULL)
Insert into Storess_table values(8, 'a', 10, 7520, 10, 2014, 'Aug')
Insert into Storess_table values(9, 'a', 15, 2030, 8, 2000, NULL)
Insert into Storess_table values(10, 'a', 21, 3160, 9, 2009, 'Oct');

Alter table Stores_table
add store_name varchar(25);
insert into store
insert into store_table values(store_id int, store_name varchar(25), storetype varchar(25), assortment int, competitionDistance int, month int, year int, promointerval int)

UPDATE orderss_table
SET Order_item = 'ABC'
WHERE order_id = 3

UPDATE Orderss_Table
SET Order_item = 'CDE'
WHERE Order_ID = 4;

UPDATE orderss_table
SET Order_item = 'DEF'
WHERE Order_ID = 5;

UPDATE orderss_table
SET Order_item = 'RDF'
WHERE Order_ID = 7;

select * from orderss_table

UPDATE orders_table
SET Order_item = 'TTT'
WHERE Order_ID = 9;

update storess_table
set promotnterval = 'Jan'
where store_id= 2

ALTER TABLE Storess_Table
RENAME COLUMN Assortment TO Store_Nos;

ALTER TABLE Storess_table
RENAME Column Assortment To Store_Nos;

Alter table Orderss_table
rename column order_item to Item_name,
rename column rep_column to Customers_name;

SELECT *
FROM Orderss_table
ORDER BY 
    Units_Cost DESC,
    Total_Price ASC;

ALTER TABLE Orderss_table
RENAME COLUMN Customers_name TO Cus_Name;

SELECT Region, Cus_Name, COUNT(*) AS Num_Customers
FROM Orderss_table
GROUP BY Region, Cus_Name;

select sum(total_price)
from Orderss_table

select sum(units_cost)
from orderss_table

create table orders_stores_table(order_date date, unit_cost int,store_type varchar(25), year int)
insert into orders_stores_table values('1/23/21', 19.99, 'range',2021)
select * from orders_stores_table

select Order_Item, region from orderss_table
where order_id in (4,5,6,9);

SELECT DISTINCT Year
FROM Storess_Table
WHERE CompetitionDistance IN (29910, 310, 3160);

SELECT DISTINCT Year
FROM Stores_Table
WHERE CompetitionDistance IN (29910, 310, 3160);

SELECT Order_Item
FROM Orderss_table
WHERE Total_Price > 200 AND Total_Price < 400;

ALTER TABLE Stores_Table
RENAME COLUMN CompetitionDistance TO CD;

sp_rename 'TableName. OldColumnName', 'New ColumnName', 'COLUMN';	

Select sum(CompetitionDistance)
from storess_table

Select count (*) as Store_type
       count (*) as Competition_Distance from storess_table

SELECT *
FROM Orderss_Table
CROSS JOIN Storess_Table;
