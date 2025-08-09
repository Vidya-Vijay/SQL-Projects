--Data Definition Language (DDL)
--Database: productionplant
--The DDL for all the tables in the productionplant database are as follows:

--Raw_Material 
CREATE TABLE `productionplant`.`raw_material` (`RawMaterial_ID` VARCHAR(4) NOT NULL , `RawMaterial_Name` VARCHAR(15) NOT NULL , 
  `RawMaterial_Price` DECIMAL(4,2) NOT NULL , `Supplier_ID` VARCHAR(3) NOT NULL , PRIMARY KEY (`RawMaterial_ID`)) ENGINE = InnoDB; 

--Supplier 
CREATE TABLE `productionplant`.`supplier` (`Supplier_ID` VARCHAR(3) NOT NULL , `Supplier_Name` VARCHAR(23) NOT NULL , `Supplier_Address` VARCHAR(27) NOT NULL , 
  `Supplier_Country` VARCHAR(25) NOT NULL , `Supplier_Contact` VARCHAR(12) NOT NULL , PRIMARY KEY (`Supplier_ID`)) ENGINE = InnoDB;

--Product_Material
CREATE TABLE `productionplant`.`product_material` (`RawMaterial_ID` VARCHAR(15) NOT NULL , `Prod_ID` VARCHAR(15) NOT NULL , 
  `QtyUsed` INT(25) NOT NULL ) ENGINE = InnoDB;

--Employee
CREATE TABLE `productionplant`.`employee` (`Emp_ID` INT(3) NOT NULL AUTO_INCREMENT , `Emp_Name` VARCHAR(13) NOT NULL , `Emp_Designation` VARCHAR(20) NOT NULL , 
  `Emp_Email` VARCHAR(25) NOT NULL , `Emp_Contact` VARCHAR(12) NOT NULL , PRIMARY KEY (`Emp_ID`)) ENGINE = InnoDB;

--Production
CREATE TABLE `productionplant`.`production` (`Prod_ID` VARCHAR(3) NOT NULL , `Prod_Plant` VARCHAR(7) NOT NULL , `Prod_Shift` VARCHAR(9) NOT NULL , 
  `Prod_Batch` VARCHAR(15) NOT NULL , `Product_ID` VARCHAR(4) NOT NULL , `Prod_Qty` INT(10) NOT NULL , `Emp_ID` INT(3) NOT NULL , 
  PRIMARY KEY (`Prod_ID`)) ENGINE = InnoDB; 

--Product
CREATE TABLE `productionplant`.`product` (`Product_ID` VARCHAR(4) NOT NULL , `Product_Name` INT(20) NOT NULL , `Product_Qty` INT(3) NOT NULL , 
  PRIMARY KEY (`Product_ID`)) ENGINE = InnoDB;

--Orders
CREATE TABLE `productionplant`.`orders` (`Order_ID` INT(4) NOT NULL AUTO_INCREMENT , `Order_Date` VARCHAR(10) NOT NULL , 
  `Order_Status` VARCHAR(10) NOT NULL , `Cust_ID` VARCHAR(3) NOT NULL , PRIMARY KEY (`Order_ID`)) ENGINE = InnoDB; 

--Order_Details
CREATE TABLE `productionplant`.`order_details` (`Order_ID` INT(4) NOT NULL, `Product_ID` VARCHAR(10) NOT NULL , `OrderQty` INT(10) NOT NULL , 
  `OrderPrice` INT(10) NOT NULL) ENGINE = InnoDB;

--Payment
CREATE TABLE `productionplant`.`payment` (`Payment_ID` INT(4) NOT NULL AUTO_INCREMENT , `Payment_Amt` DECIMAL(10,2) NOT NULL , 
  `Payment_DueDate` VARCHAR(10) NOT NULL , `Payment_Status` VARCHAR(3) NOT NULL , `Order_ID` INT(4) NOT NULL , PRIMARY KEY (`Payment_ID`)) ENGINE = InnoDB; 

--Customer
CREATE TABLE `productionplant`.`customer` (`Cust_ID` VARCHAR(3) NOT NULL ,`Cust_Name` VARCHAR(18) NOT NULL , `Cust_Address` VARCHAR(25) NOT NULL , 
  `Cust_Country` VARCHAR(15) NOT NULL , `Cust_Email` VARCHAR(22) NOT NULL ,`Cust_Contact` VARCHAR(12) NOT NULL , PRIMARY KEY (`Cust_ID `)) ENGINE = InnoDB; 

-- Some SQL Queries and Results
-- 1. List all production batches along with the associated raw materials:

SELECT production.Prod_ID, production.Prod_Plant, production.Prod_Shift, production.Prod_Batch, 
product_material.RawMaterial_ID, raw_material.RawMaterial_Name 
FROM Production 
JOIN product_material ON production.Prod_ID = product_material.PROD_ID 
JOIN raw_material ON product_material.RawMaterial_ID = raw_material.RawMaterial_ID;


-- 2. Find the total payment for each order:
SELECT Order_ID, SUM(Payment_Amt) AS TotalPayment FROM Payment GROUP BY Order_ID;

-- 3. List the products ordered along with their order quantities and prices:
SELECT product.Product_Name,order_details.Order_ID, order_details.OrderQty, order_details.OrderPrice 
FROM order_details JOIN Product ON order_details.Product_ID = product.Product_ID;

-- 4. Show the customer names and their order status:

SELECT customer.Cust_ID, customer.Cust_Name, orders.Order_ID, orders.Order_Status 
FROM customer JOIN orders ON customer.Cust_ID = orders.Cust_ID;

--5. Find total amount paid by each customer

SELECT orders.Cust_ID, SUM(payment.Payment_Amt) AS Total 
FROM Orders JOIN Payment ON orders.Order_ID = payment.Order_ID GROUP BY Cust_ID;

--6. Show all delivered orders:

SELECT Order_ID, Order_Status FROM `orders` WHERE Order_Status = 'Delivered';

--7. Show the details of product using the most expensive raw material

SELECT product.Product_ID, product.Product_Name, product.Product_Qty, raw_material.RawMaterial_ID, 
raw_material.RawMaterial_Name, raw_material.RawMaterial_Price 
FROM product JOIN production ON production.Product_ID = product.Product_ID 
OIN product_material ON product_material.Prod_ID = production.Prod_ID 
JOIN raw_material ON product_material.RawMaterial_ID = raw_material.RawMaterial_ID 
WHERE raw_material.RawMaterial_Price = (SELECT MAX(raw_material.RawMaterial_Price) FROM raw_material);

