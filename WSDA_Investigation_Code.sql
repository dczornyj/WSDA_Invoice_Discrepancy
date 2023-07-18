
-- How many transactions took place between the years 2011 and 2012?
-- A: 167 transactions

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

-- How much money did WSDA Music make during the same period?
--A: $1947.97

SELECT
	sum(total)
FROM	
	Invoice
WHERE
	InvoiceDate BETWEEN "2011-01-01 00:00:00" AND "2012-12-31 OO:00:00"
	
ORDER BY
	InvoiceDate


-- Get a list of customers who made purchases between 2011 and 2012.


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
	
-- Get a list of customers, sales reps, and total transaction amounts for each customer between 2011 and 2012.

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
	
-- How many transactions are above the average transaction amount during the same time period?

-- A: 26 transactions

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

-- Get a list of employees who exceeded the average transaction amount from sales they generated during 2011 and 2012.

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

-- Create a Commission Payout column that displays each employee’s commission based on 15% of the sales transaction amount. 

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

--Which employee made the highest commission? 

--A: Jane Peacock made the highest commission, $199.77

-- List the customers that the employee identified in the last question. 

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



-- Which customer made the highest purchase? 

-- A:John Doeein made the highest purchase



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


-- Look at this customer record—do you see anything suspicious? 

-- Yes, during the time period in question (2011-2012), John Doeein only ever made one purchase and it was for the max total as shown in the above question. Also, the only personal information that exists in our database regarding this customer is their name which is extremely suspicious.


-- Who do you conclude is our primary person of interest?

-- John Doeein is our primary person of interest as we cannot be sure whether this transaction is 100% trustworthy (it may be fraudulent). 

