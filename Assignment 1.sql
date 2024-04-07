create database Brands
create database	Products
create table bottlein (item_id int Primary Key, item_description varchar(255), vendor_nos int, vendor_name varchar(255), bottle_size int, bottle_price int)
Insert into bottlein values (1,'Travis Hasse Apple Pie',305,'Mhw Ltd',750,$9.77)
Insert into bottlein values (2,'D aristi Xtabentun',391,'Anchor Distilling (preiss Imports)',750,$14.12)
Insert into bottlein values (3,'Hiram Walker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,$6.50)
Insert into bottlein values (4,'Oak Cross Whisky',305,'Mhw Ltd',750,$25.33)
Insert into bottlein values (5,'Uv Red(cherry) Vodka',380,'Phillips Beverage Company',200,$1.97)
Insert into bottlein values (6,'Heaven Hill Old Style White Label',259,'Heaven Hill Distilleries Inc.',750,$6.37)
Insert into bottlein values (7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750,$5.06)
Insert into bottlein values (8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,$23.61)
select * from bottlein

ALTER TABLE bottlein
ADD PRIMARY KEY (item_id, 1,2,3,4,5,6,7,8);

create table PRODUCT_Table (product_id int, country varchar(25), product varchar(25),units_sold int, manufacturing_price int, sale_price int, gross_sales bigint, sales int, cogs bigint, profit int, Date date, month_Number int, month_name varchar(25), year int)
Insert into product_table values (1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014)
insert into product_table values (2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2014-01-01', 1,'January',2015)
Insert into product_table values (3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2014-06-01', 6, 'June', 2016)
Insert into product_table values (4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2014-06-01', 6, 'June', 2017)
Insert into product_table values (5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2014-06-01', 6, 'June', 2018)
Insert into product_table values (6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2014-12-01', 12, 'December', 2019)
Insert into product_table values (7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2014-03-01', 3, 'March', 2020)
Insert into product_table values (8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2014-06-01', 6, 'June', 2021)
select * from product_table

delete from product_table where units_sold =1618.5;
delete from product_table where units_sold =888;
delete from product_table where units_sold =2470;
select * from product_table
drop table product_table
select * from product_table

select sum(sale_price)
from product_table
select sum(gross_sales)
from product_table
select * from product_table;
create table product_table 
select max(year)
from product_table;

select * from product_table where sales =37050.00;

SELECT DISTINCT country
FROM product_table
WHERE profit >= 4605 AND profit <= 22662;
select product_id from product_table
where sales = 24700.00;

select item_description
from bottlein
where bottle_size=750

select vendor_name
from bottlein
where vendor_nos in (305,380,391);

select sum(bottle_price)
from bottlein

select item_id
from bottlein
where bottle_price=5.06;

Select * from bottlein
INNER JOIN Product_table on bottlein.Item_ID = product_table.product_id;

select * from bottlein
Full Outer Join Product_table on bottlein.item_id = product_table.product_id;

select * from bottlein
Left Join Product_table on bottlein.item_id = product_table.product_id;

select * 
from bottlein
cross join product_table

select * from bottlein
right join product_table on bottlein.item_id = product_table.product_id;

select * from bottlein
Outer Join Product_table on bottlein.item_id = product_table.product_id;

SELECT item_description, Product
FROM product_table
WHERE gross_sales = 13320.00;

select substring_index (item_desc1, "," ,1);

