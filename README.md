# 📦 Online-Marketplace-Data-Warehouse-Management-Business-Analytics

---

## 📘 Project Overview  
This project is an end-to-end **Enterprise Data Warehouse & Database Management System (DBMS) design** for an **Online Marketplace**.  
It includes:

- Conceptual ERD (Chen Notation)  
- Normalized schema (1NF → 3NF)  
- MySQL table implementation  
- Data insertion  
- Advanced SQL analytical queries  
- Triggers  
- Stored procedures  
- ACID & CAP theorem analysis  

The project supports analytics for:

- 📊 Price optimization  
- 👥 Customer engagement & review patterns  
- 🚚 Delivery failure & operational cost analysis  
- 💰 Monthly revenue & profit calculation  

---

## 🏗 Database Design Summary

### **Main Entities**
- Vendor  
- Customer  
- Product  
- Order  
- Review  
- Delivery  
- Revenue  
- Return  
- Experience  

### **Key Relationships**

- Product ↔ Vendor (M:N)  
- Customer ↔ Order (1:M)  
- Order ↔ Product (M:N)  
- Customer ↔ Review (1:M)  
- Product ↔ Review (1:M)  
- Order ↔ Delivery (1:M)  
- Order ↔ Revenue (1:1)  
- Order ↔ Return (1:M)  

---

## ✨ Entity Relationship Diagram
<img width="625" height="425" alt="image" src="https://github.com/user-attachments/assets/a25f29d1-e8f8-4d8c-bdaf-de3f7ef330ff" />


---
## ✨ Features

### ✔ Conceptual ER Diagram (Chen Notation)  
### ✔ Logical & Physical Database Schema  
### ✔ Fully Normalized Tables  
### ✔ Complex SQL Queries  
### ✔ Trigger to Validate Rating (≤ 5)  
### ✔ Stored Procedure: Monthly Profit Report  
### ✔ Operational & Customer Insights  

---

## 📊 Sample SQL Queries

### ⭐ Vendor Sales Ranking (Window Function)

        SELECT v.V_ID, v.Name AS VendorName,

       SUM(op.Quentity * pv.Price) AS TotalSales,
       
      RANK() OVER (ORDER BY SUM(op.Quentity * pv.Price) DESC) AS SalesRank
      
      FROM order_product op
      
      JOIN product_vendor pv ON op.P_ID = pv.P_ID
      
      JOIN vendor v ON pv.V_ID = v.V_ID
      
      GROUP BY v.V_ID;

**Result**

<img width="460" height="142" alt="image" src="https://github.com/user-attachments/assets/1f25042f-ac79-441a-9b70-217851b50c76" />

### ⭐ Customer Engagement Insights

    SELECT c.Type, AVG(e.time_spent_minutes) AS AvgTimeSpent
    FROM experience e
    JOIN customer c ON e.C_ID = c.C_ID
    GROUP BY c.Type;

**Result**

<img width="291" height="102" alt="image" src="https://github.com/user-attachments/assets/1d8f9e49-0b2a-4897-a183-48f1b0ee2541" />

---

## 🧰 Tools Used

MySQL Workbench

MySQL Server

## 📜 License

This project is published under the MIT License.

See the LICENSE file for full terms.

## 👩‍🎓 Author

Radadiya Bhavikaben Bavchandbhai

MSc Data Analytics (2024–2025)
