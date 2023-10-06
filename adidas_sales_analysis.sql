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