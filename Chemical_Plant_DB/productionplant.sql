-- Database: `productionplant`

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Cust_ID` varchar(3) NOT NULL,
  `Cust_Name` varchar(18) NOT NULL,
  `Cust_Address` varchar(25) NOT NULL,
  `Cust_Country` varchar(15) NOT NULL,
  `Cust_Email` varchar(22) NOT NULL,
  `Cust_Contact` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cust_ID`, `Cust_Name`, `Cust_Address`, `Cust_Country`, `Cust_Email`, `Cust_Contact`) VALUES
('C01', 'Johnson Corp.', '123 Main St, New York', 'USA', 'johnson@example.com', '555-123-4567'),
('C02', 'Smith Enterprises', '456 Elm St, Toronto', 'Canada', 'smith@example.com', '555-987-6543'),
('C03', 'Green Chemicals', '789 Oak St, Tokyo', 'Japan', 'greenchem@example.com', '555-456-7890'),
('C04', 'Blue Chemical Co.', '321 Pine St, London', 'UK', 'bluechem@example.com', '555-234-5678'),
('C05', 'Red Chemicals', '567 Maple St, Berlin', 'Germany', 'redchem@example.com', '555-876-5432'),
('C06', 'Yellow Solutions', '987 Birch St, LA', 'USA', 'yellow@example.com', '555-321-6789'),
('C07', 'Aqua Tech Inc.', '654 Cedar St, Vancouver', 'Canada', 'aquatech@example.com', '555-789-0123'),
('C08', 'Silver Chemicals', '852 Willow St, Osaka', 'Japan', 'silverchem@example.com', '555-210-9876'),
('C09', 'Gold Chemical Co.', '369 Walnut St, Manchester', 'UK', 'goldchem@example.com', '555-654-3210'),
('C10', 'Platinum Solutions', '963 Oakwood St, Munich', 'Germany', 'platinum@example.com', '555-543-2109');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Emp_ID` int(3) NOT NULL,
  `Emp_Name` varchar(13) NOT NULL,
  `Emp_Designation` varchar(20) NOT NULL,
  `Emp_Email` varchar(25) NOT NULL,
  `Emp_Contact` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_ID`, `Emp_Name`, `Emp_Designation`, `Emp_Email`, `Emp_Contact`) VALUES
(101, 'Tony Stark', 'Supervisor', 'john.doe@example.com', '555-123-4567'),
(102, 'Bruce Banner', 'Technician', 'jane.smith@example.com', '555-987-6543'),
(103, 'Peter Parker', 'Technician', 'mike.johnson@example.com', '555-456-7890'),
(104, 'Sam Wilson', 'Chemist', 'sarah.brown@example.com', '555-234-5678'),
(105, 'Thor Odinson ', 'Supervisor', 'david.lee@example.com', '555-876-5432'),
(106, 'Tom Jerry', 'Chemist', 'emily.wilson@example.com', '555-321-6789'),
(107, 'Taylor James', 'Boiler Operator', 'james.taylor@example.com', '555-789-0123'),
(108, 'Noah Anderson', 'Supervisor', 'lisa.anderson@example.com', '555-210-9876'),
(109, 'Clark Michael', 'Chemist', 'michael.clark@example.com', '555-654-3210'),
(110, 'Steve Rogers', 'Mechanical Engineer', 'jennifer.hall@example.com', '555-543-2109');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(4) NOT NULL,
  `Order_Date` varchar(10) DEFAULT NULL,
  `Order_Status` varchar(10) DEFAULT NULL,
  `Cust_ID` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_ID`, `Order_Date`, `Order_Status`, `Cust_ID`) VALUES
(1001, '2024-04-01', 'Pending', 'C01'),
(1002, '2024-04-02', 'Processing', 'C02'),
(1003, '2024-04-03', 'Shipped', 'C03'),
(1004, '2024-04-04', 'Delivered', 'C02'),
(1005, '2024-04-05', 'Pending', 'C05'),
(1006, '2024-04-06', 'Processing', 'C01'),
(1007, '2024-04-07', 'Shipped', 'C03'),
(1008, '2024-04-08', 'Delivered', 'C03'),
(1009, '2024-04-09', 'Pending', 'C09'),
(1010, '2024-04-10', 'Processing', 'C10');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Order_ID` int(10) NOT NULL,
  `Product_ID` varchar(10) NOT NULL,
  `OrderQty` int(10) NOT NULL,
  `OrderPrice` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`Order_ID`, `Product_ID`, `OrderQty`, `OrderPrice`) VALUES
(1001, 'P102', 50, 520),
(1001, 'P103', 52, 625),
(1001, 'P107', 40, 540),
(1003, 'P101', 20, 300),
(1005, 'P103', 60, 854),
(1005, 'P106', 35, 600),
(1006, 'P102', 14, 125),
(1008, 'P104', 30, 275),
(1008, 'P107', 25, 250);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(4) NOT NULL,
  `Payment_Amt` decimal(10,2) NOT NULL,
  `Payment_DueDate` varchar(10) DEFAULT NULL,
  `Payment_Status` varchar(7) NOT NULL,
  `Order_ID` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Payment_Amt`, `Payment_DueDate`, `Payment_Status`, `Order_ID`) VALUES
(2001, 25300.00, '2024-04-01', 'Paid', 1001),
(2002, 36102.15, '2024-04-02', 'Paid', 1002),
(2003, 5263.00, '2024-05-03', 'Pending', 1002),
(2004, 85123.50, '2024-05-03', 'Pending', 1004),
(2005, 10235.00, '2024-04-05', 'Paid', 1007),
(2006, 5500.00, '2024-04-06', 'Paid', 1006),
(2007, 125301.00, '2024-02-03', 'Pending', 1007),
(2008, 55230.00, '2024-06-01', 'Pending', 1003),
(2009, 78562.12, '2024-04-09', 'Paid', 1001),
(2010, 956214.25, '2024-04-10', 'Paid', 1010);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` varchar(4) NOT NULL,
  `Product_Name` varchar(20) NOT NULL,
  `Product_Qty` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Name`, `Product_Qty`) VALUES
('P101', 'Solvent X', 100),
('P102', 'Polyethylene Glycol', 150),
('P103', 'Acetone', 200),
('P104', 'Sulfuric acid', 120),
('P105', 'Nitric Acid', 180),
('P106', 'Methanol', 220),
('P107', 'Formaldehyde', 130),
('P108', 'Hydrogen Peroxide', 170),
('P109', 'Ammonia', 240),
('P110', 'Isopropyl alcohol', 160);

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

CREATE TABLE `production` (
  `Prod_ID` varchar(3) NOT NULL,
  `Prod_Plant` varchar(7) NOT NULL,
  `Prod_Shift` varchar(9) NOT NULL,
  `Prod_Batch` varchar(15) NOT NULL,
  `Product_ID` varchar(4) NOT NULL,
  `Prod_Qty` int(10) NOT NULL,
  `Emp_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `production`
--

INSERT INTO `production` (`Prod_ID`, `Prod_Plant`, `Prod_Shift`, `Prod_Batch`, `Product_ID`, `Prod_Qty`, `Emp_ID`) VALUES
('P01', 'Plant A', 'Morning', 'Batch 1', 'P101', 400, 101),
('P02', 'Plant B', 'Morning', 'Batch 1', 'P103', 250, 102),
('P03', 'Plant A', 'Night', 'Batch 2', 'P101', 584, 101),
('P04', 'Plant B', 'Night', 'Batch 2', 'P103', 150, 104),
('P05', 'Plant C', 'Afternoon', 'Batch 3', 'P103', 250, 103),
('P06', 'Plant C', 'Afternoon', 'Batch 4', 'P106', 465, 106),
('P07', 'Plant C', 'Evening', 'Batch 5', 'P107', 510, 103),
('P08', 'Plant D', 'Evening', 'Batch 5', 'P107', 150, 108),
('P09', 'Plant E', 'Night', 'Batch 6', 'P109', 110, 108),
('P10', 'Plant A', 'Night', 'Batch 3', 'P110', 150, 110);

-- --------------------------------------------------------

--
-- Table structure for table `product_material`
--

CREATE TABLE `product_material` (
  `RawMaterial_ID` varchar(15) NOT NULL,
  `Prod_ID` varchar(15) NOT NULL,
  `QtyUsed` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_material`
--

INSERT INTO `product_material` (`RawMaterial_ID`, `Prod_ID`, `QtyUsed`) VALUES
('RM10', 'P01', 20),
('RM2', 'P03', 25),
('RM2', 'P05', 23),
('RM3', 'P03', 75),
('RM5', 'P08', 50),
('RM6', 'P10', 55),
('RM9', 'P02', 40);

-- --------------------------------------------------------

--
-- Table structure for table `raw_material`
--

CREATE TABLE `raw_material` (
  `RawMaterial_ID` varchar(4) NOT NULL,
  `RawMaterial_Name` varchar(15) NOT NULL,
  `RawMaterial_Price` decimal(4,2) NOT NULL,
  `Supplier_ID` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `raw_material`
--

INSERT INTO `raw_material` (`RawMaterial_ID`, `RawMaterial_Name`, `RawMaterial_Price`, `Supplier_ID`) VALUES
('RM1', 'Ammonia', 10.00, '001'),
('RM10', 'Sulfur', 30.00, '010'),
('RM2', 'Chlorine', 15.00, '009'),
('RM3', 'Ethylene', 20.00, '003'),
('RM4', 'Nitric acid', 12.50, '004'),
('RM5', 'Sulfur dioxide', 18.00, '001'),
('RM6', 'Propylene', 25.00, '006'),
('RM7', 'Ethylene oxide', 14.75, '002'),
('RM8', 'Nitrogen', 22.50, '003'),
('RM9', 'Hydrogen', 17.50, '009');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` varchar(3) NOT NULL,
  `Supplier_Name` varchar(23) NOT NULL,
  `Supplier_Address` varchar(27) NOT NULL,
  `Supplier_Country` varchar(25) NOT NULL,
  `Supplier_Contact` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `Supplier_Name`, `Supplier_Address`, `Supplier_Country`, `Supplier_Contact`) VALUES
('001', 'ABC Chemicals Ltd', '123 Main St, Las Vegas', 'USA', '555-123-4567'),
('002', 'XYZ Corporation', '456 Elm St, Ottawa', 'Canada', '555-987-6543'),
('003', 'ChemTech Inc.', '789 Oak St, Tokyo', 'Japan', '555-456-7890'),
('004', 'ChemSupply Ltd.', '321 Pine St, Berlin', 'Germany', '555-234-5678'),
('005', 'Industrial Chemicals Co', '567 Maple St, Berlin', 'Germany', '555-876-5432'),
('006', 'ChemPro Ltd', '987 Birch St, Liverpool', 'UK', '555-321-6789'),
('007', 'BioChem Ltd.', '654 Cedar St, Manchester', 'UK', '555-789-0123'),
('008', 'PolymerTech Ltd', '852 Willow St, Vancouver', 'Canada', '555-210-9876'),
('009', 'ChemCo Inc.', '369 Walnut St, Vancouver', 'Canada', '555-654-3210'),
('010', 'ChemWorks', '963 Oakwood St, New York', 'USA', '555-543-2109');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cust_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Emp_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Cust_ID` (`Cust_ID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Order_ID`,`Product_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`Prod_ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Emp_ID` (`Emp_ID`);

--
-- Indexes for table `product_material`
--
ALTER TABLE `product_material`
  ADD PRIMARY KEY (`RawMaterial_ID`,`Prod_ID`);

--
-- Indexes for table `raw_material`
--
ALTER TABLE `raw_material`
  ADD PRIMARY KEY (`RawMaterial_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Cust_ID`) REFERENCES `customer` (`Cust_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`);

--
-- Constraints for table `production`
--
ALTER TABLE `production`
  ADD CONSTRAINT `production_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  ADD CONSTRAINT `production_ibfk_3` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`);

--
-- Constraints for table `raw_material`
--
ALTER TABLE `raw_material`
  ADD CONSTRAINT `raw_material_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`);
COMMIT;

--
