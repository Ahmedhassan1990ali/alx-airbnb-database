-- ================================================
-- File: performance.sql
-- Description: Initial and optimized queries to retrieve bookings
--              with user, property, and payment details
-- ================================================


-- ============================
-- 1. Initial Unoptimized Query (with filters)
-- ============================
-- Purpose: Retrieve bookings after 2024-01-01 that are 'confirmed'
-- Join with user, property, and payment details
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM Booking b
LEFT JOIN User u ON b.user_id = u.user_id
LEFT JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'confirmed'
  AND b.start_date >= '2024-01-01';


-- ============================
-- 2. Optimized Query (with filters)
-- ============================
-- Improvements:
-- - Replaced LEFT JOIN with JOIN where applicable
-- - Selected fewer, relevant fields
-- - Added WHERE clause for filtering confirmed bookings in future

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.first_name || ' ' || u.last_name AS booked_by,
    p.name AS property_name,
    pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'confirmed'
  AND b.start_date >= '2024-01-01';
