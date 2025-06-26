-- ======================
-- Sample Users
-- ======================
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (UUID(), 'Alice', 'Smith', 'alice@example.com', 'hashed_pass1', '1234567890', 'guest'),
  (UUID(), 'Bob', 'Johnson', 'bob@example.com', 'hashed_pass2', '2345678901', 'host'),
  (UUID(), 'Carol', 'Taylor', 'carol@example.com', 'hashed_pass3', '3456789012', 'guest');

-- ======================
-- Sample Properties
-- ======================
-- Bob is the host
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (UUID(), 
   (SELECT user_id FROM User WHERE email = 'bob@example.com'), 
   'Cozy Apartment in Cairo', 
   'A sunny apartment in downtown Cairo', 
   'Cairo, Egypt', 
   75.00),
   
  (UUID(), 
   (SELECT user_id FROM User WHERE email = 'bob@example.com'), 
   'Beach House in Alexandria', 
   'A peaceful beachfront house perfect for vacations', 
   'Alexandria, Egypt', 
   120.00);

-- ======================
-- Sample Bookings
-- ======================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
VALUES
  (
    UUID(),
    (SELECT property_id FROM Property WHERE name = 'Cozy Apartment in Cairo'),
    (SELECT user_id FROM User WHERE email = 'alice@example.com'),
    '2025-07-01',
    '2025-07-05',
    'confirmed'
  ),
  (
    UUID(),
    (SELECT property_id FROM Property WHERE name = 'Beach House in Alexandria'),
    (SELECT user_id FROM User WHERE email = 'carol@example.com'),
    '2025-08-10',
    '2025-08-15',
    'pending'
  );

-- ======================
-- Sample Payments
-- ======================
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  (
    UUID(),
    (SELECT booking_id FROM Booking WHERE status = 'confirmed' AND user_id = (SELECT user_id FROM User WHERE email = 'alice@example.com')),
    75.00 * 4,  -- 4 nights
    'credit_card'
  );

-- ======================
-- Sample Reviews
-- ======================
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (
    UUID(),
    (SELECT property_id FROM Property WHERE name = 'Cozy Apartment in Cairo'),
    (SELECT user_id FROM User WHERE email = 'alice@example.com'),
    5,
    'Great place to stay! Very clean and central.'
  );

-- ======================
-- Sample Messages
-- ======================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (
    UUID(),
    (SELECT user_id FROM User WHERE email = 'alice@example.com'),
    (SELECT user_id FROM User WHERE email = 'bob@example.com'),
    'Hi Bob, is your apartment available next weekend?'
  ),
  (
    UUID(),
    (SELECT user_id FROM User WHERE email = 'bob@example.com'),
    (SELECT user_id FROM User WHERE email = 'alice@example.com'),
    'Hi Alice, yes it’s available from Friday to Sunday.'
  );
