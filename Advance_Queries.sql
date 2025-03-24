# Advance Queries

# 1) Retrieve the total number of books sold for each genre
SELECT
      b.Genre, COUNT(o.Quantity) AS books_sold
      FROM books b
      JOIN orders o
      ON b.Book_ID = o.Book_ID
      GROUP BY Genre;


# 2) Find the average price of books in the "Fantasy" genre
SELECT
      ROUND(AVG(price),2) AS avg_price
      FROM books
      GROUP BY Genre
      HAVING Genre = "Fantasy";
      

# 3) List customers who have placed at least 2 orders
SELECT 
      c.Name 
      FROM customers c
      JOIN orders o
      ON c.Customer_ID = o.Customer_ID
      WHERE Quantity >= 2;
      
      
# 4) Find the most frequently ordered book  
WITH cte AS
(SELECT
      b.title, COUNT(o.Book_ID) AS frequently_ordered_book
      FROM books b
      JOIN orders o
      ON b.Book_ID = o.Book_ID
      GROUP BY b.title
)
SELECT 
      title, frequently_ordered_book
      FROM cte 
      WHERE frequently_ordered_book = (SELECT MAX(frequently_ordered_book) FROM cte);
      
      
# 5) Show the top 3 most expensive books of 'Fantasy' Genre 
SELECT
      title, price
      FROM books
      WHERE Genre = "Fantasy"
      ORDER BY Price DESC
      LIMIT 3;
      
      
# 6) Retrieve the total quantity of books sold by each author
SELECT
      b.Author, SUM(o.Quantity) AS total_quantity
      FROM books b
      JOIN orders o
      ON b.Book_ID = o.Book_ID
      GROUP BY b.Author;


# 7) List the cities where customers who spent over $30 are located
SELECT 
      c.City
      FROM customers c
      JOIN orders o
      ON c.Customer_ID = o.Customer_ID
      WHERE o.Total_Amount > 30;
      
      
# 8) Find the customer who spent the most on orders
SELECT
      c.Name, o.Total_Amount
	  FROM customers c
      JOIN orders o
      ON c.Customer_ID = o.Customer_ID
	  ORDER BY o.Total_Amount DESC
      LIMIT 1;
      
      
# 9) Calculate the stock remaining after fulfilling all orders
SELECT 
      SUM(b.Stock - o.Quantity) AS remaining_stock
      FROM books b
      JOIN orders o
      ON b.Book_ID = o.Book_ID;

     


      