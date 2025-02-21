# Chemical_Plant_DB

# Chemical Production Plant Management System using MySQL

## 📌 Overview
This project is a **MySQL-based database** for managing a **Chemical Production Plant**. It helps track raw materials, production processes, customer orders, and payments. The database is designed using **phpMyAdmin** and adheres to database normalization principles.

## 📂 Project Structure
- 📄 `productionplant.sql` → **Full database export from phpMyAdmin** (tables & data).
- 📄 `queries.sql` → **Additional SQL queries for analysis**.
- 📄 `ERD.png` → **Entity-Relationship Diagram (ERD)** showing database structure.
- 📄 `report.docx` → **Project documentation**.

## 🛠 How to Import the Database
1. Open **phpMyAdmin**.
2. Create a **new database** named `productionplant`.
3. Choose **Import** from the menu bar → Choose File → Select `productionplant.sql` → Click **Import**.

## 📊 Sample Queries
```sql
-- Show all products along with their suppliers
SELECT product.Product_Name, supplier.Supplier_Name
FROM product
JOIN supplier ON product.Supplier_ID = supplier.Supplier_ID;
```

## 🚀 Next Steps
- 🛠️ Improve query optimization.
- 📈 Integrate the database with a web-based dashboard.
- 🔍 Perform data analysis for better production insights.

## 📜 License
This project is licensed under the **Apache License 2.0** – you may use, modify, and distribute it under the terms outlined in the license.

For details, see the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0).

---

💡 *Contributions & feedback are welcome! Let me know how I can improve this project.* 🚀

