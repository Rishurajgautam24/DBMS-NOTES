-- Write an SQL statement to find the titles of books authored by an author 
-- having first name as 'Joh Paul' and last name as 'Mueller'

select c.title
from book_catalogue c, book_authors a
where c.isbn_no = a.isbn_no
and author_fname = 'Joh Paul' and author_lname = 'Mueller';


-- Write a SQL statement to find the titles of books published by 'McGraw Hill Education'
SELECT c.title FROM book_catalogue c,book_authors a 
WHERE c.isbn_no = a.isbn_no 
AND publisher='McGraw Hill Education';

-- Write a SQL statement to display the first name and the last name of students (student_fname, student_lname) 
-- pursuing 'PG' courses.

SELECT s.student_fname,s.student_lname FROM students s,members m 
WHERE s.roll_no=m.roll_no 
AND member_type='PG';
