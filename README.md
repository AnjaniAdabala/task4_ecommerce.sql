# SQL for Data Analysis – Ecommerce Dataset

## 📌 Task Overview
This project is part of a **Data Analyst Internship Task** where the objective is to use SQL queries to extract and analyze data from a database.  
I have used a **sample Ecommerce dataset** with four tables:  
- **Customers**
- **Products**
- **Orders**
- **Order_Details**

The goal is to demonstrate:
- Data selection and filtering
- Aggregation
- Joins
- Subqueries
- Views
- Query optimization

---

## 🛠 Tools Used
- **MySQL Workbench** (for writing and running SQL queries)
- **MySQL Server** (for database storage and processing)

---

## 📂 Dataset Structure

### 1. Customers Table
| Column        | Type         | Description              |
|---------------|--------------|--------------------------|
| customer_id   | INT (PK)     | Unique customer ID        |
| name          | VARCHAR(100) | Customer name            |
| email         | VARCHAR(100) | Customer email           |
| country       | VARCHAR(50)  | Country name             |

### 2. Products Table
| Column        | Type          | Description              |
|---------------|---------------|--------------------------|
| product_id    | INT (PK)      | Unique product ID        |
| product_name  | VARCHAR(100)  | Product name             |
| category      | VARCHAR(50)   | Product category         |
| price         | DECIMAL(10,2) | Price of the product     |

### 3. Orders Table
| Column        | Type      | Description               |
|---------------|-----------|---------------------------|
| order_id      | INT (PK)  | Unique order ID           |
| customer_id   | INT (FK)  | Linked customer ID        |
| order_date    | DATE      | Date of order             |

### 4. Order_Details Table
| Column          | Type     | Description              |
|-----------------|----------|--------------------------|
| order_detail_id | INT (PK) | Unique order detail ID    |
| order_id        | INT (FK) | Linked order ID          |
| product_id      | INT (FK) | Linked product ID        |
| quantity        | INT      | Quantity purchased       |

---

## 📊 Queries Implemented

### 1️⃣ SELECT, WHERE, ORDER BY
```sql
SELECT name, country
FROM customers
WHERE country = 'USA'
ORDER BY name ASC;
