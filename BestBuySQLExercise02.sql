/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.Name AS 'Product Name', C.Name AS 'Category Name'
FROM products as P
INNER JOIN categories AS C ON C.CategoryID
WHERE C.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT P.Name, P.Price, R.Rating
FROM products as P
INNER JOIN reviews as R on R.ProductID = P.ProductID
WHERE R.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS 'Total Sold'
FROM sales as s
INNER JOIN employees AS e ON e.employeeID = s.EmployeeID
GROUP BY e.EmployeeID;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS 'Department', c.Name AS 'Category'
FROM categories AS c
INNER JOIN departments as d ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) AS 'Total Sold', SUM(s.PricePerUnit*s.Quantity) AS 'Total Price'
FROM products AS p
INNER JOIN sales AS s ON s.ProductID = p.ProductID
WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS 'Product Name', r.Reviewer AS 'Reviewer Name', r.Rating AS 'Rating', r.Comment AS 'Comment'
FROM products AS p
INNER JOIN reviews as r ON r.ProductID = p.ProductID
WHERE p.ProductID = '857' AND r.Rating = 1; 

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as TotalSold
From sales as s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.First;