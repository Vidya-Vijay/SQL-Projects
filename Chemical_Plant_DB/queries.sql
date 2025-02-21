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
