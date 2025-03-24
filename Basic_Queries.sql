# Basic Queries

# 1) Retrieve all books in the "Fiction" genre
SELECT
      title 
      FROM books
      WHERE Genre = "Fiction";
      
      
# 2) Find books published after the year 1950     
SELECT 
      title
      FROM books
      WHERE Published_Year > 1950;
      
# 3) List all customers from the Canada
SELECT
      Name
      FROM customers
      WHERE City = "Canada";
      
      
# 4) Show orders placed in November 2023
SELECT 
      *
      FROM orders
      WHERE MONTHNAME(Order_Date) = "November";


# 5) Retrieve the total stock of books available
SELECT
      SUM(Stock) AS total_stock
      FROM books;
      
      
# 6) Find the details of the most expensive book
SELECT
      *
      FROM books
      WHERE price = (SELECT MAX(price) FROM books);


# 7) Show all customers who ordered more than 1 quantity of a book
SELECT
      c.Name 
      FROM customers c
      JOIN orders o
      ON c.Customer_ID = o.Customer_ID
      WHERE o.Quantity >1;
      
      
# 8) Retrieve all orders where the total amount exceeds $20
SELECT
      *
      FROM orders
      WHERE Total_Amount > 20;
      
      
# 9) List all genres available in the Books table
SELECT
      DISTINCT Genre
      FROM books;
      
      
# 10) Find the book with the lowest stock
SELECT 
      title
      FROM books
      WHERE Stock = (SELECT MIN(Stock) FROM books);
      
      
# 11) Calculate the total revenue generated from all orders  
SELECT
      ROUND(SUM(Quantity * Total_Amount),2) AS total_revenue
      FROM orders;

 