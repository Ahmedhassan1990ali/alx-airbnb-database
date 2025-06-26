# 🏠 AirBnB Clone – Database Schema

This folder contains the SQL schema for the **AirBnB Clone** project. It defines all tables, relationships, and constraints using **MySQL 8.0+**, following best practices in normalization and indexing.

---

## 📄 Files

- `schema.sql` – MySQL script to create the database schema.

---

## 📦 Entities Overview

- **User** – Application users (guests, hosts, admins)
- **Property** – Listings created by hosts
- **Booking** – Reservations made by users
- **Payment** – Payments linked to bookings
- **Review** – Ratings and comments on properties
- **Message** – Communication between users

---

## ⚙️ Requirements

- MySQL 8.0 or higher
- MySQL CLI or GUI (like MySQL Workbench)

> ✅ MySQL 8+ is required for `UUID()`, `CHECK`, and `ENUM` support.

---

## 🚀 Usage

Follow these steps to initialize the schema.

### 📌 Step 1: Create a Database (optional)

```sql
CREATE DATABASE airbnb_clone;
USE airbnb_clone;
```

### 🛠️ Step 2: Run the Schema Script

From your terminal or MySQL shell, run:

```bash
mysql -u your_username -p airbnb_clone < schema.sql
```

- Replace `your_username` with your MySQL username.  
- Enter your MySQL password when prompted.

### ✅ Step 3: Verify Tables

After the script runs successfully, verify the created tables:

```sql
SHOW TABLES;
DESCRIBE User;
DESCRIBE Property;
-- etc.
```
You should see all six tables:
`User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`.

---

Let me know if you'd like this appended to a full README again or need a `.md` file version.
