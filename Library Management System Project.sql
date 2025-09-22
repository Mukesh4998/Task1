DROP DATABASE Library;
USE Library;
CREATE DATABASE Library;
-- Members Table
DROP TABLE Members;
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    join_date DATE DEFAULT NOW()
);

-- Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    category VARCHAR(50),
    isbn VARCHAR(20) UNIQUE,       -- International Standard Book Number
    published_year YEAR,
    available_copies INT DEFAULT 1,
    total_copies INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
ALTER TABLE Books MODIFY published_year INT;


-- Borrow Records Table
CREATE TABLE Borrow_Records (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE DEFAULT NOW(),
    due_date DATE,
    return_date DATE,
    fine DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);



-- Insert data into Members table
INSERT INTO Members (name, email, phone, address, join_date) VALUES
('Alice Johnson', 'alice1@example.com', '1111111111', 'New York', '2023-01-10'),
('Bob Smith', 'bob2@example.com', '2222222222', 'Chicago', '2023-02-15'),
('Charlie Brown', 'charlie3@example.com', '3333333333', 'Los Angeles', '2023-03-05'),
('David Clark', 'david4@example.com', '4444444444', 'Houston', '2023-04-01'),
('Eva Green', 'eva5@example.com', '5555555555', 'Phoenix', '2023-05-20'),
('Frank White', 'frank6@example.com', '6666666666', 'San Francisco', '2023-06-30'),
('Grace Lee', 'grace7@example.com', '7777777777', 'Dallas', '2023-07-12'),
('Henry Adams', 'henry8@example.com', '8888888888', 'Miami', '2023-08-08'),
('Ivy Wilson', 'ivy9@example.com', '9999999999', 'Atlanta', '2023-09-14'),
('Jack Miller', 'jack10@example.com', '1010101010', 'Boston', '2023-10-22'),
('Kate Turner', 'kate11@example.com', '1112223334', 'Seattle', '2023-11-05'),
('Leo Harris', 'leo12@example.com', '1212121212', 'Denver', '2023-12-01'),
('Mia Scott', 'mia13@example.com', '1313131313', 'Orlando', '2024-01-17'),
('Noah Evans', 'noah14@example.com', '1414141414', 'Austin', '2024-02-25'),
('Olivia Young', 'olivia15@example.com', '1515151515', 'San Diego', '2024-03-10');


-- Insert data into Authors table
INSERT INTO Authors (name, bio) VALUES
('J.K. Rowling', 'Author of Harry Potter series'),
('George Orwell', 'Author of 1984 and Animal Farm'),
('J.R.R. Tolkien', 'Author of The Lord of the Rings'),
('Agatha Christie', 'Mystery novels writer'),
('Dan Brown', 'Author of The Da Vinci Code'),
('Stephen King', 'Horror and thriller author'),
('Mark Twain', 'Author of Adventures of Tom Sawyer'),
('Charles Dickens', 'Classic English novelist'),
('Harper Lee', 'Author of To Kill a Mockingbird'),
('F. Scott Fitzgerald', 'Author of The Great Gatsby');

-- Insert data into Books table
INSERT INTO Books (title, author_id, category, isbn, published_year, available_copies, total_copies) VALUES
('Harry Potter and the Sorcerer\'s Stone', 1, 'Fantasy', '9780439708180', 1997, 5, 5),
('Harry Potter and the Chamber of Secrets', 1, 'Fantasy', '9780439064873', 1998, 4, 4),
('1984', 2, 'Dystopian', '9780451524935', 1949, 3, 3),
('Animal Farm', 2, 'Satire', '9780451526342', 1945, 2, 2),
('The Hobbit', 3, 'Fantasy', '9780345339683', 1937, 6, 6),
('The Lord of the Rings', 3, 'Fantasy', '9780618640157', 1954, 7, 7),
('Murder on the Orient Express', 4, 'Mystery', '9780062693662', 1934, 5, 5),
('The Da Vinci Code', 5, 'Thriller', '9780307474278', 2003, 8, 8),
('Angels & Demons', 5, 'Thriller', '9780743493468', 2000, 6, 6),
('The Shining', 6, 'Horror', '9780307743657', 1977, 4, 4),
('It', 6, 'Horror', '9781501142970', 1986, 3, 3),
('Adventures of Tom Sawyer', 7, 'Classic', '9780486400778', 1876, 2, 2),
('Great Expectations', 8, 'Classic', '9780141439563', 1861, 3, 3),
('A Tale of Two Cities', 8, 'Classic', '9781853262647', 1859, 2, 2),
('To Kill a Mockingbird', 9, 'Classic', '9780061120085', 1960, 5, 5),
('Go Set a Watchman', 9, 'Classic', '9780062409851', 2015, 3, 3),
('The Great Gatsby', 10, 'Classic', '9780743273565', 1925, 6, 6),
('Tender is the Night', 10, 'Classic', '9780684801544', 1934, 2, 2),
('Carrie', 6, 'Horror', '9780307743664', 1974, 4, 4),
('The Mystery of the Blue Train', 4, 'Mystery', '9780007119356', 1928, 3, 3);

-- Insert data into Borrow_Records table
INSERT INTO Borrow_Records (member_id, book_id, issue_date, due_date, return_date, fine) VALUES
(1, 3,  '2024-01-10', '2024-01-24', '2024-01-22', 0.00),
(2, 5,  '2024-01-12', '2024-01-26', NULL, 0.00),
(3, 1,  '2024-01-15', '2024-01-29', '2024-02-01', 2.00),
(4, 8,  '2024-01-18', '2024-02-01', '2024-02-03', 2.00),
(5, 10, '2024-02-01', '2024-02-15', NULL, 0.00),
(6, 2,  '2024-02-05', '2024-02-19', '2024-02-18', 0.00),
(7, 17, '2024-02-08', '2024-02-22', NULL, 0.00),
(8, 12, '2024-02-12', '2024-02-26', NULL, 0.00),
(9, 15, '2024-02-15', '2024-02-29', '2024-03-03', 3.00),
(10, 20,'2024-02-20', '2024-03-05', NULL, 0.00),
(11, 6, '2024-03-01', '2024-03-15', NULL, 0.00),
(12, 7, '2024-03-02', '2024-03-16', '2024-03-20', 4.00),
(13, 9, '2024-03-05', '2024-03-19', NULL, 0.00),
(14, 13,'2024-03-06', '2024-03-20', NULL, 0.00),
(15, 18,'2024-03-07', '2024-03-21', NULL, 0.00);


