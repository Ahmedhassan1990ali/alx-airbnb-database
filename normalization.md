### Booking Entity – Normalization Note

**Removed:** `total_price` attribute from the **Booking** entity.

**Reason:**

- `total_price` can be **calculated** from the property's `price_per_night` and the number of stay days (`check_out - check_in`).
- Keeping `total_price` would introduce a **derived/redundant field**, violating **Third Normal Form (3NF)**.
- Property prices may **change dynamically** (e.g., seasonal pricing, special offers), so recalculating ensures accuracy at the time of **reservation or payment**.

