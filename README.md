# E-Commerce Database Project

## Project Overview

This project implements a relational database for an E-Commerce system using PostgreSQL on the Neon platform.

The database is designed according to relational database principles and includes tables for users, categories, products, orders, order items, and payments. The project demonstrates the use of primary keys, foreign keys, constraints, and sample data to ensure data integrity.

---

## Database Tables

The project contains the following tables:

- users
- categories
- products
- orders
- items_order
- payments

---

## Features

- Relational database design
- Primary Keys
- Foreign Keys
- NOT NULL constraints
- UNIQUE constraints
- CHECK constraints
- DEFAULT values
- Sample data insertion
- Data integrity validation

---

## Project Files

| File | Description |
|------|-------------|
| `README.md` | Project documentation |
| `01_create_tables.sql` | Database schema (tables, keys, constraints) |
| `02_insert_sample_data.sql` | Sample data insertion |
| `erd.png` | Entity Relationship Diagram (ERD) |

---

## Technologies Used

- PostgreSQL
- Neon Database
- SQL

---

## Database Structure

```
Users
   │
   └── Orders
            │
            └── Items_Order
                     │
                     └── Products
                               │
                               └── Categories

Orders
   │
   └── Payments
```

---

## How to Run

1. Create a PostgreSQL database (Neon).
2. Execute:

```sql
01_create_tables.sql
```

3. Execute:

```sql
02_insert_sample_data.sql
```

4. Verify that all tables and sample data have been created successfully.

---

## Sample Data

The database includes:

- 8 Users
- 5 Categories
- 20 Products
- 10 Orders
- 25 Order Items
- 8 Payments

---

## Notes

- All relationships are enforced using Foreign Keys.
- Data integrity is maintained using CHECK, UNIQUE, NOT NULL, and DEFAULT constraints.
- Sample data is provided for testing.