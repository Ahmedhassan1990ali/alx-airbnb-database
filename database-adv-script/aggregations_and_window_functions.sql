-- ===============================================
-- File: aggregations_and_window_functions.sql
-- Description: SQL queries using aggregation and window functions
-- ===============================================


-- ===============================================
-- 1. Aggregation: Total number of bookings made by each user
-- ===============================================
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;


-- ===============================================
-- 2. Window Functions: Rank properties by number of bookings
--                      using ROW_NUMBER, RANK, and DENSE_RANK
-- ===============================================
SELECT 
    property_id,
    property_name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank,
    DENSE_RANK() OVER (ORDER BY total_bookings DESC) AS dense_booking_rank
FROM (
    SELECT 
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM Property p
    LEFT JOIN Booking b ON p.property_id = b.property_id
    GROUP BY p.property_id, p.name
) AS ranked_properties;
