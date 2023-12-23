-- Create Books Table
CREATE TABLE Books (
    id_book INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    category VARCHAR(50),
    purchase_price DECIMAL(10, 2),
    date_purchased DATE
);

-- Create Users Table
CREATE TABLE Users (
    id_user INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(255)
);

-- Create Transactions Table
CREATE TABLE Transactions (
    id_transaction INT PRIMARY KEY,
    id_book INT,
    id_user INT,
    borrow_date DATE,
    return_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_book) REFERENCES Books(id_book),
    FOREIGN KEY (id_user) REFERENCES Users(id_user)
);

-- Insert Sample Data into Books Table
INSERT INTO Books VALUES
(1, 'Book Title 1', 'Author 1', 'Category 1', 29.99, '2023-01-01'),
(2, 'Book Title 2', 'Author 2', 'Category 2', 19.99, '2023-02-15');
-- Add more rows as needed

-- Insert Sample Data into Users Table
INSERT INTO Users VALUES
(1, 'User 1', 'Address 1', '123-456-7890', 'user1@example.com'),
(2, 'User 2', 'Address 2', '987-654-3210', 'user2@example.com');
-- Add more rows as needed

-- Insert Sample Data into Transactions Table
INSERT INTO Transactions VALUES
(1, 1, 1, '2023-03-01', '2023-03-15', 'Borrowed'),
(2, 2, 2, '2023-04-01', '2023-04-15', 'Returned');
-- Add more rows as needed
