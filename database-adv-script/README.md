# 🗃️ Airbnb-Style SQL Query Scripts

This repository contains SQL scripts for querying a PostgreSQL database designed for an Airbnb-like booking system. The schema includes users, properties, bookings, payments, reviews, and messages — all tied together with appropriate constraints and indexing.

---

## 📁 File: `joins_queries.sql`

### Description
This file includes SQL queries demonstrating different types of **JOINs** to extract meaningful information from the database. Each query is documented and easy to modify for additional filters or use cases.

### Included Queries

1. ### 🔗 INNER JOIN – Bookings and Booking Users
   Retrieves all bookings along with details of the users who made them.
   - Joins `Booking` and `User` tables.
   - Useful for reservation dashboards, user activity tracking, etc.

2. ### 🔍 LEFT JOIN – Properties and Reviews
   Retrieves all properties along with their reviews, if any.
   - Joins `Property` and `Review` tables.
   - Includes properties with **no reviews**, making it useful for identifying under-reviewed or new listings.

3. ### 🌐 FULL OUTER JOIN – Users and Bookings
   Retrieves all users and all bookings, regardless of whether they’re linked.
   - Joins `User` and `Booking` using a `FULL OUTER JOIN`.
   - Useful for reporting on inactive users or orphaned bookings.

---

## 🛠️ How to Use

- Run the file using a PostgreSQL client such as:
  ```bash
  psql -U your_user -d your_database -f joins_queries.sql
  ```


---

## 📁 File: `subqueries.sql`

### Description

This script contains **advanced SQL queries** that demonstrate the use of both correlated and non-correlated subqueries within the Airbnb-like database schema.

### Included Queries

1. ### ⭐ Properties with Average Rating > 4.0

   * Uses a **non-correlated subquery** with `GROUP BY` and `HAVING` to calculate the average rating per property.
   * Filters properties whose average review rating exceeds 4.0.
   * Ideal for showcasing top-rated listings.

2. ### 👤 Users with More Than 3 Bookings

   * Uses a **correlated subquery** that counts the number of bookings per user.
   * Filters users who have made more than three bookings.
   * Useful for identifying frequent users or loyal customers.

---

## 🛠️ How to Use

* Run the file in a PostgreSQL-compatible environment using a command-line client such as:

  ```
  psql -U your_username -d your_database -f subqueries.sql
  ```

* Make sure the `Property`, `Review`, `User`, and `Booking` tables exist and are populated with sample data for meaningful results.

---

### 🧠 Notes on Subqueries

* A **correlated subquery** refers to columns from the outer query and is evaluated once per outer row.
  Example: `SELECT COUNT(*) FROM Booking WHERE Booking.user_id = User.user_id`

* A **non-correlated subquery** is independent of the outer query and often used in `IN`, `EXISTS`, or `HAVING` clauses.
  Example: `SELECT property_id FROM Review GROUP BY property_id HAVING AVG(rating) > 4.0`

Understanding the differences between these two types is essential for writing optimized and readable SQL queries, especially in reporting and analytics contexts.

---



## 📁 File: `aggregations_and_window_functions.sql`

### Description
This script contains SQL queries that demonstrate how to use **aggregation functions** and **window functions** for analysis and reporting in the Airbnb-style database.

### Included Queries

1. ### 📊 Total Bookings per User
   - Uses `COUNT()` with `GROUP BY` to get how many bookings each user has made.
   - Includes `first_name` and `last_name` for context.
   - Uses `LEFT JOIN` so users with no bookings are still included.

2. ### 🏆 Property Ranking with `ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()`
   - Calculates total bookings for each property using `COUNT()`.
   - Ranks properties using three different window functions:
     - `ROW_NUMBER()` – always gives a unique sequential number
     - `RANK()` – same rank for ties, skips next numbers
     - `DENSE_RANK()` – same rank for ties, does **not** skip numbers
   - Great for building leaderboards, pagination, and comparison of rank styles.

---

## 🛠️ How to Use

- Run the file using a PostgreSQL client such as:
  ```bash
  psql -U your_username -d your_database -f aggregations_and_window_functions.sql
  ```

---

### ✅ Notes

- PostgreSQL requires all selected non-aggregated columns to be listed in the `GROUP BY` clause.
- Window functions allow you to perform ranking and row-based calculations **without reducing row count**, unlike aggregation.
- All window functions are applied **without reducing rows** — they let you keep full property detail.
- These queries can be wrapped into views for use in analytics dashboards.

These queries are ideal for dashboards, leaderboards, user engagement stats, and more.

---






