-- Online Book Bank Management System
-- Sample data inserts

-- Departments
INSERT INTO departments (department_id, name) VALUES
(1, 'Computer Science'),
(2, 'Electronics'),
(3, 'Mechanical');

-- Users
INSERT INTO users (user_id, full_name, email, password_hash, role, department_id) VALUES
(1, 'Aarav Sharma', 'aarav@college.edu', 'hash_aarav', 'student', 1),
(2, 'Neha Iyer', 'neha@college.edu', 'hash_neha', 'student', 1),
(3, 'Rohan Patel', 'rohan@college.edu', 'hash_rohan', 'student', 2),
(4, 'Admin User', 'admin@college.edu', 'hash_admin', 'admin', NULL);

-- Subjects
INSERT INTO subjects (subject_id, subject_name, department_id) VALUES
(1, 'Database Management Systems', 1),
(2, 'Operating Systems', 1),
(3, 'Data Structures', 1),
(4, 'Digital Electronics', 2),
(5, 'Thermodynamics', 3);

-- Books
INSERT INTO books (book_id, title, isbn, edition, publication_year, language, description) VALUES
(1, 'Database System Concepts', '9780073523323', '6th', 2019, 'English', 'Core DBMS textbook'),
(2, 'Operating System Concepts', '9781118063330', '10th', 2020, 'English', 'OS fundamentals'),
(3, 'Introduction to Algorithms', '9780262033848', '3rd', 2009, 'English', 'Algorithms reference'),
(4, 'Digital Design', '9780134549897', '6th', 2018, 'English', 'Digital electronics'),
(5, 'Engineering Thermodynamics', '9780073398174', '8th', 2017, 'English', 'Mechanical basics');

-- Authors
INSERT INTO authors (author_id, author_name) VALUES
(1, 'Abraham Silberschatz'),
(2, 'Henry F. Korth'),
(3, 'S. Sudarshan'),
(4, 'Thomas H. Cormen'),
(5, 'Charles E. Leiserson'),
(6, 'David Patterson'),
(7, 'Morris Mano');

-- Book-Authors
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 1),
(3, 4), (3, 5),
(4, 7),
(5, 6);

-- Book-Subjects
INSERT INTO book_subjects (book_id, subject_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Book Copies
INSERT INTO book_copies (copy_id, book_id, copy_code, condition_status, availability_status) VALUES
(1, 1, 'BB-CSE-DBMS-001', 'good', 'available'),
(2, 1, 'BB-CSE-DBMS-002', 'good', 'issued'),
(3, 2, 'BB-CSE-OS-001', 'new', 'available'),
(4, 3, 'BB-CSE-DSA-001', 'fair', 'issued'),
(5, 4, 'BB-ECE-DE-001', 'good', 'available'),
(6, 5, 'BB-MECH-THERMO-001', 'good', 'available');

-- Borrow Transactions
INSERT INTO borrow_transactions
(transaction_id, user_id, copy_id, issue_date, due_date, return_date, status) VALUES
(1, 1, 2, '2026-04-01', '2026-04-15', NULL, 'issued'),
(2, 2, 4, '2026-03-20', '2026-04-03', NULL, 'overdue'),
(3, 3, 3, '2026-03-01', '2026-03-15', '2026-03-12', 'returned');

-- Reservations
INSERT INTO reservations (reservation_id, user_id, book_id, reservation_date, status) VALUES
(1, 2, 1, '2026-04-10 10:00:00', 'active'),
(2, 1, 3, '2026-04-11 09:30:00', 'fulfilled');
