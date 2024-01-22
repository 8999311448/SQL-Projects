-- Create the database if not exists
CREATE DATABASE IF NOT EXISTS LibraryManagement;

-- Switch to the created database
USE LibraryManagement;

-- Create tables
CREATE TABLE tbl_publisher (PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL,
    PublisherAddress VARCHAR(255),
    PublisherPhone VARCHAR(20)
);

CREATE TABLE tbl_book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    PublisherID INT,
    FOREIGN KEY (PublisherID) REFERENCES tbl_publisher(PublisherID)
);

CREATE TABLE tbl_library_branch (
    BranchID INT PRIMARY KEY AUTO_INCREMENT,
    BranchName VARCHAR(255) NOT NULL,
    BranchAddress VARCHAR(255) NOT NULL
);

CREATE TABLE tbl_borrower (
    CardNo INT PRIMARY KEY AUTO_INCREMENT,
    BorrowerName VARCHAR(255) NOT NULL,
    BorrowerAddress VARCHAR(255),
    BorrowerPhone VARCHAR(20)
);

CREATE TABLE tbl_book_loans (
    LoansID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    BranchID INT,
    CardNo INT,
    DateOut DATE,
    DueDate DATE,
    FOREIGN KEY (BookID) REFERENCES tbl_book(BookID),
    FOREIGN KEY (BranchID) REFERENCES tbl_library_branch(BranchID),
    FOREIGN KEY (CardNo) REFERENCES tbl_borrower(CardNo)
);

CREATE TABLE tbl_book_copies (
    CopiesID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    BranchID INT,
    No_Of_Copies INT NOT NULL,
    FOREIGN KEY (BookID) REFERENCES tbl_book(BookID),
    FOREIGN KEY (BranchID) REFERENCES tbl_library_branch(BranchID)
);

CREATE TABLE tbl_book_authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    AuthorName VARCHAR(255) NOT NULL,
    FOREIGN KEY (BookID) REFERENCES tbl_book(BookID)
);

-- Insert values into tbl_publisher
INSERT INTO tbl_publisher (PublisherID, PublisherName, PublisherAddress, PublisherPhone)
VALUES
    (1, 'ABC Publications', '123 Publishing St', '555-1234'),
    (2, 'XYZ Books', '456 Book Lane', '555-5678'),
    (3, 'PQR Press', '789 Print Blvd', '555-9012'),
    (4, 'LMN Media', '101 Media Avenue', '555-3456'),
    (5, 'Book Haven', '202 Reading Road', '555-7890'),
    (6, 'Novel World', '303 Story Street', '555-2345');

 Select * from tbl_publisher;

-- Inserting values into tbl_book
INSERT INTO tbl_book (BookID, Title, PublisherID)
VALUES
    (1, 'The Lost Tribe', 1),
    (2, 'Mystery Mansion', 2),
    (3, 'Adventure Awaits', 3),
    (4, 'Science Wonders', 4),
    (5, 'Poetry Collection', 5),
    (6, 'Historical Journeys', 6);
    
    Select * from tbl_book;
    
    -- Insert values into tbl_library_branch
INSERT INTO tbl_library_branch (BranchID, BranchName, BranchAddress)
VALUES
    (1, 'Central', '123 Main St, Central City'),
    (2, 'Sharpstown', '456 Oak St, Sharpstown'),
    (3, 'Northside', '789 Pine St, Northside'),
    (4, 'West End', '101 Elm St, West End'),
    (5, 'Eastside', '202 Maple St, Eastside'),
    (6, 'Southville', '303 Cedar St, Southville');
    
    Select * from tbl_library_branch;
    
-- Inserting values into tbl_borrower
INSERT INTO tbl_borrower (CardNo, BorrowerName, BorrowerAddress, BorrowerPhone)
VALUES
    (1, 'Alice Johnson', '123 Park St', '555-1111'),
    (2, 'Bob Smith', '456 Meadow Ave', '555-2222'),
    (3, 'Charlie Davis', '789 River Rd', '555-3333'),
    (4, 'David White', '101 Hill St', '555-4444'),
    (5, 'Eva Brown', '202 Forest Ave', '555-5555'),
    (6, 'Frank Miller', '303 Lake Blvd', '555-6666');
    
    Select * from tbl_borrower;
    
-- Inserting values into tbl_book_loans
INSERT INTO tbl_book_loans (BookID, BranchID, CardNo, DateOut, DueDate)
VALUES
    (1, 1, 1, '2024-01-21', '2024-02-21'),
    (2, 2, 2, '2024-01-22', '2024-02-22'),
    (3, 3, 3, '2024-01-23', '2024-02-23'),
    (4, 4, 4, '2024-01-24', '2024-02-24'),
    (5, 5, 5, '2024-01-25', '2024-02-25'),
    (6, 6, 6, '2024-01-26', '2024-02-26');

Select * from tbl_book_loans;

-- Inserting values into tbl_book_copies
INSERT INTO tbl_book_copies (BookID, BranchID, No_Of_Copies)
VALUES
    (1, 1, 10),
    (2, 2, 15),
    (3, 3, 20),
    (4, 4, 12),
    (5, 5, 18),
    (6, 6, 25);

Select * from tbl_book_copies;

-- Inserting values into tbl_book_authors
INSERT INTO tbl_book_authors (BookID, AuthorName)
VALUES
    (1, 'Author One'),
    (2, 'Author Two'),
    (3, 'Author Three'),
    (4, 'Author Four'),
    (5, 'Author Five'),
    (6, 'Author Six');

Select * from tbl_book_authors;

-- Retrieve books and their publishers:
SELECT b.Title, p.PublisherName
FROM tbl_book b
INNER JOIN tbl_publisher p ON b.PublisherID = p.PublisherID;

-- Retrieve books and their authors:
SELECT b.Title, a.AuthorName
FROM tbl_book b
INNER JOIN tbl_book_authors a ON b.BookID = a.BookID;

-- Retrieve borrowers with their loaned books:
SELECT br.BorrowerName, b.Title
FROM tbl_borrower br
INNER JOIN tbl_book_loans bl ON br.CardNo = bl.CardNo
INNER JOIN tbl_book b ON bl.BookID = b.BookID;

-- Retrieve overdue book loans:
SELECT bl.*, b.Title, br.BranchName
FROM tbl_book_loans bl
INNER JOIN tbl_book b ON bl.BookID = b.BookID
INNER JOIN tbl_library_branch br ON bl.BranchID = br.BranchID
WHERE bl.DueDate < CURDATE();

-- Retrieve borrowers who have overdue books:
SELECT br.BorrowerName, bl.DateOut, bl.DueDate, b.Title, bl.BranchID
FROM tbl_borrower br
INNER JOIN tbl_book_loans bl ON br.CardNo = bl.CardNo
INNER JOIN tbl_book b ON bl.BookID = b.BookID
WHERE bl.DueDate < CURDATE();

-- Retrieve books with no available copies:
SELECT b.Title
FROM tbl_book b
LEFT JOIN tbl_book_copies bc ON b.BookID = bc.BookID
WHERE bc.No_Of_Copies IS NULL OR bc.No_Of_Copies = 0;

-- Retrieve the branch with the most books loaned out:
SELECT br.BranchName, COUNT(bl.LoansID) AS TotalLoans
FROM tbl_library_branch br
LEFT JOIN tbl_book_loans bl ON br.BranchID = bl.BranchID
GROUP BY br.BranchName
ORDER BY TotalLoans DESC
LIMIT 1;

--  Retrieve books published by a specific publisher:
SELECT Title
FROM tbl_book
WHERE PublisherID = (SELECT PublisherID FROM tbl_publisher WHERE PublisherName = 'ABC Publications');

-- Retrieve the total number of books in the library:
SELECT COUNT(BookID) AS TotalBooks
FROM tbl_book;

-- Retrieve the names and addresses of borrowers who have phone numbers:
SELECT BorrowerName, BorrowerAddress
FROM tbl_borrower
WHERE BorrowerPhone IS NOT NULL;

-- Retrieve books loaned out after a specific date:
SELECT b.Title, bl.DateOut, bl.DueDate
FROM tbl_book_loans bl
INNER JOIN tbl_book b ON bl.BookID = b.BookID
WHERE bl.DateOut > '2024-01-25';

-- Retrieve the number of copies for each book:
SELECT b.Title, SUM(bc.No_Of_Copies) AS TotalCopies
FROM tbl_book b
LEFT JOIN tbl_book_copies bc ON b.BookID = bc.BookID
GROUP BY b.Title;

-- Find Books Authored by a Specific Author:
SELECT b.Title, ba.AuthorName
FROM tbl_book b, tbl_book_authors ba
WHERE b.BookID = ba.BookID AND ba.AuthorName = 'Author One';

-- Retrieve Books Loaned by a Specific Borrower:
SELECT b.Title, bl.DateOut, bl.DueDate
FROM tbl_book_loans bl, tbl_book b
WHERE bl.BookID = b.BookID
  AND bl.CardNo = 1;

-- List Overdue Books:
SELECT b.Title, bl.DueDate
FROM tbl_book_loans bl, tbl_book b
WHERE bl.BookID = b.BookID AND bl.DueDate < CURDATE();

-- Retrieve books with the highest number of copies available at any branch:
SELECT b.Title, MAX(bc.No_Of_Copies) AS MaxCopies
FROM tbl_book b
LEFT JOIN tbl_book_copies bc ON b.BookID = bc.BookID
GROUP BY b.Title
ORDER BY MaxCopies DESC
LIMIT 1;

-- Retrieve books with multiple authors:
SELECT b.Title, GROUP_CONCAT(ba.AuthorName SEPARATOR ', ') AS Authors
FROM tbl_book b
INNER JOIN tbl_book_authors ba ON b.BookID = ba.BookID
GROUP BY b.Title
HAVING COUNT(ba.AuthorID) > 1;

-- Retrieve books with the most overdue copies:
SELECT b.Title, COUNT(bl.LoansID) AS OverdueCopies
FROM tbl_book b
LEFT JOIN tbl_book_loans bl ON b.BookID = bl.BookID
WHERE bl.DueDate < CURDATE()
GROUP BY b.Title
ORDER BY OverdueCopies DESC
LIMIT 1;

-- Retrieve borrowers who have borrowed books from all branches:
SELECT br.BorrowerName
FROM tbl_borrower br
CROSS JOIN tbl_library_branch lb
WHERE NOT EXISTS (
    SELECT 1
    FROM tbl_library_branch bl
    LEFT JOIN tbl_book_loans bln ON bl.BranchID = bln.BranchID AND br.CardNo = bln.CardNo
    WHERE bln.LoansID IS NULL
);

-- Retrieve books that have been borrowed more than once:
SELECT b.Title, COUNT(bl.LoansID) AS TotalBorrowings
FROM tbl_book b
INNER JOIN tbl_book_loans bl ON b.BookID = bl.BookID
GROUP BY b.Title
HAVING TotalBorrowings > 1;


