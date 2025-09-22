1. What is normalization?
       The process of organizing data in a database to reduce redundancy and improve data integrity. It involves breaking down tables into smaller, related tables.
2. Explain primary vs foreign key.
       A Primary Key uniquely identifies a row in its own table (e.g., book_id). A Foreign Key is a column in one table that references the Primary Key of another table to create a link (e.g., author_id in the books table).
3. What are constraints?
       Rules enforced on data columns to ensure data integrity. Examples: PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK.
4. What is a surrogate key?
       An artificial key (usually a simple number) created to uniquely identify a row when a natural key (like a book title) isn't suitable. book_id and author_id in our example are surrogate keys.
5. How do you avoid data redundancy?
       Primarily through normalization and using foreign key relationships. Instead of storing the author's name in every book record, we store it once in an authors table and just link to it with author_id.
6. What is an ER diagram?
       An Entity-Relationship Diagram is a visual representation of the database's logical structure, showing entities (as boxes), their attributes (as ovals), and the relationships between them (as lines).
7. What are the types of relationships in DBMS?
     One-to-One (e.g., one user has one passport), One-to-Many (e.g., one author has many books), Many-to-Many (e.g., many members borrow many books, implemented via a junction table like borrow_records).
8. Explain the purpose of AUTO_INCREMENT.
       It automatically generates a unique number for the primary key column each time a new row is inserted, saving you the effort of manually managing these IDs.
9. What is the default storage engine in MySQL?
       InnoDB. It supports transactions and foreign keys, which MyISAM (the old default) does not.
10. What is a composite key?
        A primary key that consists of two or more columns. This is used when a single column isn't unique enough. For example, in a class_registrations table, the combination of student_id and class_id could be the composite key.
