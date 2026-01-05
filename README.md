# Gram-panchayat-management-system

# Citizen Database Management System

A Java-based application using **JDBC** and **MySQL** to manage and query **Gram Panchayat citizen data**.
The project demonstrates real-world use of **relational databases**, **SQL queries**, and **backend development** concepts.

---

## Project Overview

This system connects a Java application to a MySQL database and executes multiple queries related to:

* Citizens
* Households
* Land ownership
* Panchayat employees
* Government assets
* Vaccination records

It is designed as an **academic project** simulating an **e-governance / Panchayat Management System**.

---

## Tech Stack

* **Java**
* **JDBC**
* **MySQL**
* **SQL (Joins, Aggregations, Subqueries)**

---

##  Database Tables

* `citizens`
* `households`
* `land_records`
* `panchayat_employees`
* `assets`
* `vaccinations`

---

##  Features & Queries Implemented

* Retrieve citizens owning **more than 1 acre of land**
* Identify **female citizens** from low-income households
* Calculate **total rice cultivation land area**
* Count citizens with **10th qualification (born after 2000)**
* Find **Panchayat employees** owning land
* List **Pradhan’s family members**
* Count **street lights installed in 2024**
* Count **vaccinations for 10th-qualified citizens (2024)**
* Count **male births in 2024**
* Count citizens belonging to **Panchayat employee households**

---

##  Project Structure

```bash
CitizenDatabase.java
```

* Establishes MySQL connection using JDBC
* Executes SQL queries using `PreparedStatement`
* Handles results using `ResultSet`
* Uses try-with-resources for safe database access

---

##  How to Run

1. Create the MySQL database and required tables
2. Update database credentials in the code:

   ```java
   private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database_name";
   private static final String USER = "your_username";
   private static final String PASSWORD = "your_password";
   ```
3. Add **MySQL JDBC Driver** to your project
4. Compile and run:

   ```bash
   javac CitizenDatabase.java
   java CitizenDatabase
   ```

---

##  Learning Outcomes

* Hands-on experience with **JDBC**
* Writing **complex SQL queries**
* Understanding **relational database design**
* Backend development for **e-governance systems**




