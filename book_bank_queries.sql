-- Online Book Bank Management System
-- Demo and viva queries

-- Q1. Search books by title keyword
SELECT book_id, title, edition, publication_year
FROM books
WHERE title LIKE '%Database%';

-- Q2. List books with author names
SELECT b.book_id, b.title, a.author_name
FROM books b
JOIN book_authors ba ON b.book_id = ba.book_id
JOIN authors a ON ba.author_id = a.author_id
ORDER BY b.title;

-- Q3. Show available copies of each book
SELECT b.book_id, b.title, COUNT(*) AS available_copies
FROM books b
JOIN book_copies bc ON b.book_id = bc.book_id
WHERE bc.availability_status = 'available'
GROUP BY b.book_id, b.title
ORDER BY available_copies DESC;

-- Q4. Issue a book copy to a user
-- Example: user_id = 1 issues copy_id = 1
INSERT INTO borrow_transactions (user_id, copy_id, issue_date, due_date, status)
VALUES (1, 1, CURRENT_DATE, CURRENT_DATE + INTERVAL 14 DAY, 'issued');

UPDATE book_copies
SET availability_status = 'issued'
WHERE copy_id = 1;

-- Q5. Return a book copy
-- Example: return transaction_id = 1
UPDATE borrow_transactions
SET return_date = CURRENT_DATE, status = 'returned'
WHERE transaction_id = 1;

UPDATE book_copies
SET availability_status = 'available'
WHERE copy_id = (
    SELECT copy_id FROM borrow_transactions WHERE transaction_id = 1
);

-- Q6. List overdue books with student details
SELECT bt.transaction_id, u.full_name, u.email, b.title, bt.issue_date, bt.due_date
FROM borrow_transactions bt
JOIN users u ON bt.user_id = u.user_id
JOIN book_copies bc ON bt.copy_id = bc.copy_id
JOIN books b ON bc.book_id = b.book_id
WHERE bt.status IN ('issued', 'overdue')
  AND bt.due_date < CURRENT_DATE
  AND bt.return_date IS NULL
ORDER BY bt.due_date;

-- Q7. Count books borrowed by each student
SELECT u.user_id, u.full_name, COUNT(bt.transaction_id) AS total_borrowed
FROM users u
LEFT JOIN borrow_transactions bt ON u.user_id = bt.user_id
WHERE u.role = 'student'
GROUP BY u.user_id, u.full_name
ORDER BY total_borrowed DESC;

-- Q8. Top 5 most borrowed books
SELECT b.book_id, b.title, COUNT(bt.transaction_id) AS borrow_count
FROM borrow_transactions bt
JOIN book_copies bc ON bt.copy_id = bc.copy_id
JOIN books b ON bc.book_id = b.book_id
GROUP BY b.book_id, b.title
ORDER BY borrow_count DESC
LIMIT 5;

-- Q9. Show active reservations queue
SELECT r.reservation_id, u.full_name, b.title, r.reservation_date
FROM reservations r
JOIN users u ON r.user_id = u.user_id
JOIN books b ON r.book_id = b.book_id
WHERE r.status = 'active'
ORDER BY r.reservation_date ASC;

-- Q10. Department-wise book count by subject mapping
SELECT d.name AS department, s.subject_name, COUNT(bs.book_id) AS total_books
FROM departments d
JOIN subjects s ON d.department_id = s.department_id
LEFT JOIN book_subjects bs ON s.subject_id = bs.subject_id
GROUP BY d.name, s.subject_name
ORDER BY d.name, total_books DESC;
