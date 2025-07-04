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
This script contains **advanced SQL queries** that use subqueries to extract more specific, calculated, or conditional results from the Airbnb-like schema.

### Included Queries

1. ### ⭐ Properties with Average Rating > 4.0
   - Uses a **scalar subquery** to calculate the average rating for each property.
   - Filters for properties with an average rating strictly greater than 4.0.
   - Useful for showcasing high-performing listings on the platform.

2. ### 👤 Users with More Than 3 Bookings
   - Uses a **correlated subquery** to count how many bookings each user has made.
   - Filters for users who have made **more than three** bookings.
   - Ideal for identifying power users or frequent travelers.

---

## 🛠️ How to Use

- Run the file using a PostgreSQL client such as:
  ```bash
  psql -U your_username -d your_database -f subqueries.sql
  ```

---

### 🧠 Notes on Subqueries

- A **correlated subquery** depends on a value from the outer query and runs once per row. Example: counting bookings per user.
- A **non-correlated subquery** runs independently and can often be optimized. Example: computing average property ratings.

These patterns are important in analytics, filtering, and performance-aware query design.


---

## 📁 File: `aggregations_and_window_functions.sql`

### Description
This script contains SQL queries that demonstrate how to use **aggregation functions** and **window functions** for analysis and reporting in the Airbnb-style database.

### Included Queries

1. ### 📊 Total Bookings per User
   - Uses `COUNT()` with `GROUP BY` to find how many bookings each user has made.
   - Includes user details like first and last name.
   - Uses `LEFT JOIN` to show users even if they have made no bookings.

2. ### 🏆 Property Booking Rank
   - Uses a window function (`RANK() OVER (...)`) to assign a rank to each property based on how many bookings it has received.
   - Useful for leaderboard-style analytics or highlighting popular listings.
   - Ties receive the same rank (as opposed to `ROW_NUMBER`, which is always unique).

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

These queries are ideal for dashboards, leaderboards, user engagement stats, and more.

