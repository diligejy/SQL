SELECT CUSTOMERNUMBER
  FROM CLASSICMODELS.CUSTOMERS;
  
SELECT COUNT(CUSTOMERNUMBER)
  FROM CLASSICMODELS.CUSTOMERS;
  
SELECT SUM(amount), COUNT(checknumber)
  FROM CLASSICMODELS.PAYMENTS;
  
SELECT productname, productline
  FROM CLASSICMODELS.PRODUCTS;
  
SELECT COUNT(productCode) as n_products
  FROM CLASSICMODELS.PRODUCTS;
  
SELECT DISTINCT(ordernumber)
  FROM CLASSICMODELS.ORDERDETAILS;
  
SELECT *
  FROM CLASSICMODELS.ORDERDETAILS
  WHERE priceeach BETWEEN 30 AND 40;
  
SELECT *
  FROM CLASSICMODELS.ORDERDETAILS
  WHERE priceeach >= 30;
  
SELECT customernumber
  FROM CLASSICMODELS.CUSTOMERS
  WHERE country IN  ('USA', 'CANADA');
  
SELECT customernumber
  FROM CLASSICMODELS.CUSTOMERS
  WHERE country NOT IN ('USA', 'Canada');
  
SELECT employeenumber
  FROM CLASSICMODELS.EMPLOYEES
  WHERE reportsto IS NULL;
  
SELECT addressline1
  FROM CLASSICMODELS.CUSTOMERS
  WHERE addressline1 LIKE '%ST%';

SELECT country, city, COUNT(customernumber) n_customers
  FROM CLASSICMODELS.CUSTOMERS
  GROUP BY country, city;
  
SELECT SUM(CASE WHEN country = 'USA' THEN 1 ELSE 0 END) N_USA
	   , SUM(CASE WHEN country = 'USA' THEN 1 ELSE 0 END) / COUNT(*) USA_POPULATION
  FROM CLASSICMODELS.CUSTOMERS;
  
SELECT A.ordernumber, B.country
  FROM CLASSICMODELS.ORDERS A 
  LEFT JOIN CLASSICMODELS.CUSTOMERS B
  ON A.customernumber = B.customernumber;	
  
SELECT A.ordernumber, B.country
  FROM CLASSICMODELS.ORDERS A
  LEFT JOIN CLASSICMODELS.CUSTOMERS B
  ON A.customernumber = B.customernumber
  WHERE B.country = 'USA';
  
SELECT A.ordernumber, B.country
  FROM CLASSICMODELS.ORDERS A
  INNER JOIN CLASSICMODELS.CUSTOMERS B
  ON A.customernumber = B.customernumber
  WHERE B.country = 'USA';
  
SELECT country, 
  CASE WHEN country IN ('USA', 'Canda') THEN 'North America' ELSE 'OTHERS' END AS region
  FROM CLASSICMODELS.CUSTOMERS;
  
SELECT CASE WHEN country  IN ('USA', 'Canada') THEN 'North America' ELSE 'OTHERS' END AS region
   , COUNT(CUSTOMERNUMBER) AS n_customers
  FROM CLASSICMODELS.CUSTOMERS
  GROUP BY CASE WHEN country IN ('USA', 'Canada') THEN 'North America' ELSE 'OTHERS' END;
  
  
SELECT CASE WHEN country IN ('USA', 'Canada') THEN 'North America' ELSE 'OTHERS' END AS region
  , COUNT(customernumber) as n_customers
  FROM CLASSICMODELS.CUSTOMERS
  GROUP BY 1;
  
SELECT 
  ROW_NUMBER() OVER (ORDER BY buyprice) ROWNUMBER,
  RANK() OVER (ORDER BY buyprice) RANKNUMBER,
  DENSE_RANK() OVER (ORDER BY buyprice) DENSERANK
  FROM CLASSICMODELS.PRODUCTS;
  
SELECT buyprice,
  ROW_NUMBER() OVER(PARTITION BY productline ORDER BY buyprice) ROWNUMBER,
  RANK() OVER(PARTITION BY productline ORDER BY buyprice) RNK,
  DENSE_RANK() OVER(PARTITION BY productline ORDER BY buyprice) DENSERANK
  FROM CLASSICMODELS.PRODUCTS;
  
-- NYC에 거주하는 고객들의 주문번호 조회
SELECT ordernumber
  FROM CLASSICMODELS.ORDERS
  WHERE customerNumber 
  in 
  (SELECT customernumber 
     FROM CLASSICMODELS.CUSTOMERS 
     WHERE city = 'NYC');
	
-- USA 거주자의 주문번호 조회
SELECT ordernumber
  FROM CLASSICMODELS.ORDERS
  WHERE customerNumber 
  IN 
  (SELECT customerNumber 
     FROM CLASSICMODELS.CUSTOMERS
     WHERE country = 'USA');
