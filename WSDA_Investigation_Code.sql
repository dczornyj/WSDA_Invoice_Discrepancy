
-- 1) Taking a look at all of the transactions that took place between the years 2011 and 2012.

SELECT
	InvoiceId,
	BillingCity,
	total,
	InvoiceDate
	
FROM	
	Invoice
WHERE
	InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 OO:00:00"
	
ORDER BY
	InvoiceDate



-- 2) Obtaining the total sum in WSDA music sales during the same period (2011-2012)?


SELECT
	sum(total)
FROM	
	Invoice
WHERE
	InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 OO:00:00"
	
ORDER BY
	InvoiceDate


-- 3) Obtaining a list of customers who made purchases between 2011 and 2012.


SELECT
	i.InvoiceDate,
	c.CustomerId,
	c.FirstName,
	c.LastName
FROM		
	Customer as c
INNER JOIN
	Invoice as i
ON
	c.CustomerId = i.CustomerId
WHERE
	InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 OO:00:00"
	
ORDER BY
	c.LastName

	
-- 4) Digging deeper and creating a list of customers, sales reps, and total transaction amounts for each customer between 2011 and 2012.

TABLE QUERIED IN DB BROWSER

SELECT
	total AS "Total Transaction Amount",
	c.FirstName || ' ' || c.LastName as "Customer Name", 
	e.FirstName || ' ' || e.LastName as "Employee Name",
	c.CustomerID
FROM 
	Invoice as i 
INNER JOIN
	Customer as c
ON
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee as e
ON 	
	c.SupportRepId = e.EmployeeId
WHERE 
	InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 00:00:00"
ORDER BY
	total
	
-- 5) Starting to look for outliers by querying how many transactions are above the average transaction amount during the same time period?

SELECT
	CustomerId,
	InvoiceDate,
	total
FROM 
	INVOICE
WHERE	
	InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 00:00:00"
	AND
	total > 
(SELECT
	avg(total)
FROM	
	Invoice
WHERE	
	InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 00:00:00")

-- 6) Querying a list of employees who exceeded the average transaction amount from sales they generated during 2011 and 2012.

SELECT
	sum(i.total), 
	e.FirstName || ' ' || e.LastName as "Employee Name"
FROM 
	Invoice as i 
INNER JOIN
	Customer as c
ON
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee as e
ON 	
	c.SupportRepId = e.EmployeeId
WHERE
	InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 00:00:00"
AND 
	total > 11.66
GROUP BY 
	e.FirstName,
	e.LastName
ORDER BY e.LastName

	
-- 7) Creating a Commission Payout column to display each employee’s commission based on 15% of the sales transaction amount. 

SELECT
	sum(i.total), 
	e.FirstName || ' ' || e.LastName as "Employee Name",
	0.15*sum(i.total) AS "Commission Earned"
FROM 
	Invoice as i 
INNER JOIN
	Customer as c
ON
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee as e
ON 	
	c.SupportRepId = e.EmployeeId
WHERE
	InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 00:00:00"
GROUP BY 
	e.FirstName,
	e.LastName
ORDER BY e.LastName

-- 8) Which employee made the highest commission? 

--A: Jane Peacock made the highest commission, $199.77

	
-- 9) Look into which customers the employee from the last question facilitated in the Sales process. 

SELECT 
	e.FirstName || ' ' || e.LastName as "Employee Name",
	c.FirstName || ' ' || c.LastName as "Customer Name"
FROM 
	Invoice as i 
INNER JOIN
	Customer as c
ON
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee as e
ON 	
	c.SupportRepId = e.EmployeeId
WHERE
InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 00:00:00"
AND 
	e.EmployeeId = 3
GROUP BY 
		C.LastName

ORDER BY e.LastName



-- 10) Which customer made the highest purchase? 


SELECT 
	e.FirstName || ' ' || e.LastName as "Employee Name",
	c.FirstName || ' ' || c.LastName as "Customer Name",
	MAX(total)
FROM 
	Invoice as i 
INNER JOIN
	Customer as c
ON
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee as e
ON 	
	c.SupportRepId = e.EmployeeId
WHERE
	InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 00:00:00"
AND 
	e.EmployeeId = 3
GROUP BY 
		C.LastName

ORDER BY e.LastName


