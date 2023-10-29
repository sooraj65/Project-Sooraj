---1 database creation
CREATE TABLE sales_sample (
    Product_id integer,
    Region varchar(50),
    Date date,
    Sales_amount numeric
);

---2 data creation
INSERT INTO sales_sample (Product_id, Region, Date, Sales_amount)
VALUES
    (1, 'East', '2023-10-01', 1000.00),
    (2, 'West', '2023-10-02', 750.50),
    (3, 'North', '2023-10-03', 1200.25),
    (4, 'South', '2023-10-04', 850.75),
    (5, 'East', '2023-10-05', 900.30),
    (6, 'West', '2023-10-06', 1100.20),
    (7, 'North', '2023-10-07', 600.00),
    (8, 'South', '2023-10-08', 950.60),
    (9, 'East', '2023-10-09', 800.75),
    (10, 'West', '2023-10-10', 1300.40);
	
--- 3 OLAP operations 
---a Drill down
SELECT Region, Product_id, SUM(Sales_amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_id
ORDER BY Region, Product_id;

--- b roll up
SELECT Region, Product_id, SUM(Sales_amount) AS Total_Sales
FROM sales_sample
GROUP BY ROLLUP (Region, Product_id)
ORDER BY Region, Product_id;

---C  Cube
SELECT Product_id, Region, Date, SUM(Sales_amount) AS Total_Sales
FROM sales_sample
GROUP BY CUBE (Product_id, Region, Date)
ORDER BY Product_id, Region, Date;

--- D slice
  ---by region
SELECT Region, SUM(Sales_amount) AS Total_Sales
FROM sales_sample
WHERE Region = 'East'
GROUP BY Region;

  --- by date
SELECT Date, SUM(Sales_amount) AS Total_Sales
FROM sales_sample
WHERE Date BETWEEN '2023-10-01' AND '2023-10-09'
GROUP BY Date;

---E Dice
SELECT Product_id, Region, Date, SUM(Sales_amount) AS Total_Sales
FROM sales_sample
WHERE (Product_id = 1 OR Product_id = 2) -- Specify product criteria
  AND Region = 'East' -- Specify region criteria
  AND Date BETWEEN '2023-10-01' AND '2023-10-08' -- Specify date range
GROUP BY Product_id, Region, Date;