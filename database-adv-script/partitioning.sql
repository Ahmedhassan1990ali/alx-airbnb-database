-- ======================================================
-- File: partitioning.sql
-- Description: Partitioning the Booking table by start_date
-- ======================================================

-- STEP 1: Rename original table (if needed)
ALTER TABLE Booking RENAME TO Booking_old;

-- STEP 2: Create new partitioned parent table
CREATE TABLE Booking (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- STEP 3: Create partitions (example: yearly)
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- STEP 4: Copy data from old table
INSERT INTO Booking
SELECT booking_id, property_id, user_id, start_date, end_date, status, created_at
FROM Booking_old;

-- STEP 5: (Optional) Drop or archive old table
-- DROP TABLE Booking_old;

-- STEP 6: Add necessary indexes to partitions
CREATE INDEX idx_booking_2023_user_id ON Booking_2023(user_id);
CREATE INDEX idx_booking_2024_user_id ON Booking_2024(user_id);
CREATE INDEX idx_booking_2025_user_id ON Booking_2025(user_id);

-- STEP 7: Sample test query
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2024-06-01' AND '2024-07-01';
