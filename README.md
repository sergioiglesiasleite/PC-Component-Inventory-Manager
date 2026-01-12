# PC Component Inventory Manager 🖥️

A **Full-Stack Inventory Management System** designed for IT hardware retailers. This project demonstrates the implementation of a relational database structure, CRUD operations, and secure backend logic using native PHP and MySQL.

## 🚀 Project Overview

This application simulates a real-world inventory environment, allowing administrators to manage stock, pricing, and suppliers for next-gen PC components.

**Key Technical Features:**
* **Relational Database Design:** Normalized tables (`products`, `categories`, `suppliers`) connected via **Foreign Keys** to maintain data integrity.
* **CRUD Functionality:** Create, Read, and manage hardware components dynamically.
* **Security:** Implementation of **PDO Prepared Statements** to prevent SQL Injection attacks.
* **Data Logic:** Real-time stock status visualization (conditional formatting) and complex SQL Joins.

## 🛠️ Tech Stack

* **Backend:** PHP 8+ (PDO Interface).
* **Database:** MySQL / MariaDB (Relational Model).
* **Frontend:** HTML5, CSS3.
* **Environment:** Apache Server (XAMPP).

## ⚙️ Installation & Setup

To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/sergioiglesiasleite/PC-Component-Inventory-Manager.git](https://github.com/sergioiglesiasleite/PC-Component-Inventory-Manager.git)
    ```

2.  **Database Setup:**
    * Open your MySQL manager (phpMyAdmin, DBeaver, or Workbench).
    * Create a new database or just import the file included in this repo:
    * 📄 **File:** `database_setup.sql` (or `schema.sql`).
    * *This script will create the tables and populate them with +40 sample items (RTX 5090, Ryzen 10000, etc.).*

3.  **Connection Configuration:**
    * Open `db.php` and configure your local credentials if necessary:
    ```php
    $host = 'localhost';
    $dbname = 'pc_inventory_db';
    $username = 'root'; // Change if needed
    $password = '';     // Change if needed
    ```

4.  **Run:**
    * Place the project folder in your server directory (e.g., `htdocs` in XAMPP).
    * Access via browser: `http://localhost/pc-inventory/`

## 🗃️ Database Structure (ERD)

The system is built upon a strong relational schema:
* **Products:** Main entity containing price, stock, and SKU.
* **Categories:** Categorization logic (CPU, GPU, RAM, Motherboard).
* **Suppliers:** Vendor information management.

---
**Author:** Sergio Iglesias 