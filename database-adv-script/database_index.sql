-- ===============================================
-- File: database_index.sql
-- Description: Indexes for performance optimization
-- ===============================================

-- ===== User Table Indexes =====
CREATE INDEX idx_user_email ON User(email);
-- email lookups (e.g., login, user retrieval)

-- ===== Booking Table Indexes =====
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_created_at ON Booking(created_at);
-- Indexes for joins, filters, and date-based analytics

-- ===== Property Table Indexes =====
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);
-- Used in filters and sorting (e.g., by price or location)

/*
benchmark_queries

-- Example 1: Booking count per user
EXPLAIN ANALYZE
SELECT user_id, COUNT(*) 
FROM Booking 
GROUP BY user_id;

-- Example 2: Properties ranked by bookings
EXPLAIN ANALYZE
SELECT property_id, COUNT(*) 
FROM Booking 
GROUP BY property_id 
ORDER BY COUNT(*) DESC;

-- Example 3: Filter bookings by status and start_date
EXPLAIN ANALYZE
SELECT * 
FROM Booking 
WHERE status = 'confirmed' AND start_date >= CURRENT_DATE;

*/