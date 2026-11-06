# Online Book Bank Management System (SQL / DBMS)

A normalized relational database (3NF, 10 tables) for an academic library: catalogue management, copy-level availability, borrowing and returns, overdue tracking and a reservation queue.

## Schema
`departments`, `users` (student/admin roles), `subjects`, `books`, `authors`, `book_authors`, `book_subjects`, `book_copies`, `borrow_transactions`, `reservations`

Design highlights:
- Title metadata (`books`) is separated from physical inventory (`book_copies`), so availability and condition are tracked per copy.
- Many-to-many links for authors and subjects through junction tables.
- `CHECK` constraints for roles, copy condition, availability and transaction status; foreign keys with `ON DELETE CASCADE` where appropriate.
- Standard 14-day loan period.

See `book_bank_erd.png` for the ER diagram.

## Files
| File | Purpose |
|---|---|
| `book_bank_schema.sql` | Table definitions |
| `book_bank_sample_data.sql` | Demo data (fictional users) |
| `book_bank_queries.sql` | 10 demo queries |
| `book_bank_erd.png` | ER diagram |

## Example queries included
Search by title, books with authors, available copies per book (`JOIN` + `GROUP BY`), issue and return a copy, overdue list with student details, books borrowed per student, top 5 most borrowed books, active reservation queue, department-wise subject mapping.

## Run (MySQL)
```sql
SOURCE book_bank_schema.sql;
SOURCE book_bank_sample_data.sql;
SOURCE book_bank_queries.sql;
```

## Tech
MySQL, SQL (DDL, DML, joins, aggregates, subqueries), ER modelling, normalization

## Authors
Group project: Ayan Aqeel, Abdul Rehman, Hamza Sheikh, Muhammad Mahad — Bahria University Islamabad.
