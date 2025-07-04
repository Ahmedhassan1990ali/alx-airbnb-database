-- ===============================================
-- 1. INNER JOIN: Retrieve all bookings and the respective users who made them
-- ===============================================
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status,
    b.created_at AS booking_created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;

-- ===============================================
-- 2. LEFT JOIN: Retrieve all properties and their reviews,
--              including properties that have no reviews
-- ===============================================
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_created_at
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id
ORDER BY p.name ASC, r.rating DESC;

-- ===============================================
-- 3. FULL OUTER JOIN: Retrieve all users and all bookings,
--                     even if the user has no booking or the booking is not linked to a user
-- ===============================================
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM User u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
