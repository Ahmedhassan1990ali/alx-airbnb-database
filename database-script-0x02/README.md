# 🌱 AirBnB Clone – Sample Data (Seed Script)

This script inserts realistic sample data into the AirBnB Clone database. It helps developers and testers populate the schema with useful records for local development, debugging, and demo purposes.

---

## 📄 Files

- `seed.sql` – Contains `INSERT` statements for users, properties, bookings, payments, reviews, and messages.
- Assumes the schema is already created using `schema.sql`.

---

## ⚙️ Requirements

- MySQL 8.0+ database
- Existing database initialized from `schema.sql`

---

## 🚀 Usage

### 📌 Step 1: Create and initialize your database (if not already done)

```bash
mysql -u your_username -p -e "CREATE DATABASE airbnb_clone;"
mysql -u your_username -p airbnb_clone < ../schema.sql
```

### Step 2: Load the seed data

```bash
mysql -u your_username -p airbnb_clone < seed.sql
```
🔁 **Resetting the Database**

You can safely re-run `schema.sql` before re-seeding with `seed.sql` to reset your database to a clean state.

---

## 📦 What’s Included in the Seed Script?

### ✅ Users
- 2 guests and 1 host

### ✅ Properties
- 2 properties created by the host

### ✅ Bookings
- 2 bookings (1 confirmed, 1 pending)

### ✅ Payments
- 1 payment associated with a confirmed booking

### ✅ Reviews
- 1 review linked to a completed stay

### ✅ Messages
- A conversation between a guest and the host

---

## 📌 Notes

- `UUID()` is used to auto-generate unique identifiers for all entities.
- Foreign key relationships are handled using `SELECT` subqueries based on unique values like `email` and `property name`.
- Dates are set in the **future (2025)** to reflect realistic upcoming reservations.

---

## 📬 Questions?

Feel free to open an issue or modify `seed.sql` to better suit your specific testing needs.
