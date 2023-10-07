-- CREATE DATABASE adidasdb;

-- USE adidasdb;

/*

SELECT 
	*
FROM
	dbo.['Data Sales Adidas$'];



	

*/


-- How many records are there in the Adidas sales dataset?

SELECT 
	COUNT(*) 'Total Records'
FROM
	dbo.['Data Sales Adidas$'];

-- What are the unique product names in the dataset?

SELECT DISTINCT 
	Product
FROM
	dbo.['Data Sales Adidas$'];

-- States

SELECT DISTINCT 
	State
FROM
	dbo.['Data Sales Adidas$'];

-- Top 5 States by Total Sales Revenue

SELECT TOP 5 
	State
	,SUM([Total Sales]) 'Total Sales Revenue'
FROM
	dbo.['Data Sales Adidas$']
GROUP BY
	State
ORDER BY
	'Total Sales Revenue' DESC;

-- Bottom 5 States by Total Sales Revenue

SELECT TOP 5 
	State
	,SUM([Total Sales]) 'Total Sales Revenue'
FROM
	dbo.['Data Sales Adidas$']
GROUP BY
	State
ORDER BY
	'Total Sales Revenue';

-- Which products have a price per unit greater than $50?

SELECT DISTINCT
	Product
FROM
	dbo.['Data Sales Adidas$']
WHERE [Price per Unit] > 50;

-- What is the average total sales revenue by region?

SELECT 
	Region
	,AVG([Total Sales]) 'Average Total Sales Revenue'
FROM
	dbo.['Data Sales Adidas$']
GROUP BY 
	Region
ORDER BY
	'Average Total Sales Revenue' DESC;

-- What is the total profit for each sales method 

SELECT
	[Sales Method] 'Sales Method'
	,SUM([Operating Profit]) 'Total Profit'
FROM
	dbo.['Data Sales Adidas$']
GROUP BY
	[Sales Method]
ORDER BY
	'Total Profit' DESC;

-- Top 5 retailers with the highest total sales?

SELECT TOP 5
	Retailer
	,SUM([Total Sales]) 'Total Sales'
FROM
	dbo.['Data Sales Adidas$']
GROUP BY
	Retailer
ORDER BY
	[Total Sales] DESC;

-- What is the monthly average operating margin for Adidas products?
SELECT
	MONTH([Invoice Date]) 'Month of Invoice'
	,AVG([Operating Profit]) 'Avg Operating Margin'
FROM
	dbo.['Data Sales Adidas$']
GROUP BY 
	MONTH([Invoice Date])
ORDER BY
	'Month of Invoice';

-- Which products had the highest total profit in 2021?

SELECT TOP 1
	Product
	,SUM([Operating Profit]) 'Total Profit'
FROM
	dbo.['Data Sales Adidas$']
WHERE
	YEAR([Invoice Date]) = '2021'
GROUP BY
	Product
ORDER BY
	'Total Profit' DESC;

-- What is the monthly growth rate in total sales revenue?

SELECT 
	MONTH([Invoice Date]) 'Month of Invoice'
	,SUM([Total Sales])   'Total Sales'
	,LAG(SUM([Total Sales])) OVER(ORDER BY MONTH([Invoice Date])) 'Previous Month Sales'
FROM
	dbo.['Data Sales Adidas$']
GROUP BY 
	MONTH([Invoice Date]);

-- What is the total number of units sold for each products
SELECT 
	 Product
	,COUNT(*) 'Total Products Sold'
FROM
	dbo.['Data Sales Adidas$']
GROUP BY
	Product
ORDER BY
	'Total Products Sold' DESC;

-- Which month had the highest total sales revenue in 2021?

SELECT TOP 1
	MONTH([Invoice Date]) 'Month of Invoice'
	,[Total Sales]
FROM
	dbo.['Data Sales Adidas$']
WHERE 
	YEAR([Invoice Date]) = '2021'
ORDER BY
	[Total Sales] DESC;

--  Identify the top-selling product category for each region.

WITH top_selling_product AS (
	SELECT 
		Region
		,Product
		,SUM([Total Sales]) 'Total Sales'
		,ROW_NUMBER()OVER(PARTITION BY Region ORDER BY SUM([Total Sales]) DESC) RN
	FROM
		dbo.['Data Sales Adidas$']
	GROUP BY
		Region
		,Product
		)
SELECT 
	Region
	,Product
FROM	
	top_selling_product
WHERE 
	RN = 1;


