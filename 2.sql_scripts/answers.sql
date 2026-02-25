--Lesson 10 – Aggregations (COUNT, SUM, AVG, GROUP BY)
--SECTION 1 – COUNT Aggregations (10 Questions)
--1. How many total properties are in the database?
use [Property24];
select * from [dbo].[Property_DATA];
--2. How many properties are listed in each province?
select * from [dbo].[Property_DATA];
SELECT Province,  COUNT(*) AS total_properties
FROM Property_DATA
GROUP BY Province;  
--3. How many properties are listed in each city?
select * from [dbo].[Property_DATA];
SELECT city, COUNT(*) AS properties
FROM Property_DATA
GROUP BY city;
--4. How many properties have more than 2 bedrooms?
select * from [dbo].[Property_DATA];
SELECT COUNT(*) AS total_properties
FROM  Property_DATA
WHERE BEDROOMS > 2;
--5. How many properties have 2 or more bathrooms?
select * from [dbo].[Property_DATA];
SELECT COUNT(*) AS PropertiesWithManyBathrooms
FROM Property_DATA
WHERE bathrooms >= 2;
--6. How many properties have parking for at least 2 cars?
select * from [dbo].[Property_DATA];
SELECT COUNT(*) AS Parking
FROM Property_DATA 
WHERE parking >= 2;
--7. How many properties are priced above R3,000,000?
select * from [dbo].[Property_DATA];
SELECT COUNT(property_id) AS ExpensiveProperties
FROM Property_DATA 
WHERE Property_price > 3000000;
--8. How many properties are in Gauteng?
select * from [dbo].[Property_DATA];
SELECT COUNT(*) AS TotalProperties
FROM Property_DATA
WHERE Province = 'Gauteng';
--9. How many properties per province have floor size greater than 200?
select * from [dbo].[Property_DATA];
SELECT Province,COUNT(*) AS NumberOfProperties
FROM Property_DATA
WHERE Floor_Size > 200
GROUP BY Province;
--10. How many distinct provinces are in the table?
select * from [dbo].[Property_DATA];
SELECT COUNT(DISTINCT province) 
AS unique_province_count
FROM Property_DATA;
--SECTION 2 – SUM Aggregations (10 Questions)
--11. What is the total value of all properties combined?
select * from [dbo].[Property_DATA];
SELECT SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS TotalValue
FROM [dbo].[Property_DATA];
--12. What is the total property value per province?
select * from [dbo].[Property_DATA];
SELECT PROVINCE, SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS TotalPropertyValue
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE
ORDER BY TotalPropertyValue DESC;
--13. What is the total property value per city?
SELECT CITY, SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS TotalPropertyValue
FROM [dbo].[Property_DATA]
GROUP BY CITY
ORDER BY TotalPropertyValue DESC;
--14. What is the total monthly repayment for all properties?
SELECT SUM(CAST(Monthly_Repayment AS BIGINT)) AS Totalmonthlyrepayment 
FROM [dbo].[Property_DATA]
--15. What is the total monthly repayment per province?
SELECT PROVINCE, SUM(CAST(Monthly_Repayment AS BIGINT)) AS Totalmonthlyrepayment
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE
--16. What is the total once-off cost for all properties?
select * from [dbo].[Property_DATA];
SELECT SUM(CAST(TOTAL_ONCE_OFF_COSTS AS BIGINT)) AS Totalonceoff
FROM [dbo].[Property_DATA]
--17. What is the total once-off cost per province?
SELECT * FROM [dbo].[Property_DATA];
SELECT PROVINCE, SUM(CAST( TOTAL_ONCE_OFF_COSTS AS BIGINT)) AS TOTALONCEOFF
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE;
--18. What is the total property value for Gauteng?
SELECT * FROM [dbo].[Property_DATA];
SELECT SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS TotalGautengValue
FROM [dbo].[Property_DATA]
WHERE province = 'Gauteng';
--19. What is the total property value for properties priced above R4,000,000?
SELECT * FROM [dbo].[Property_DATA];
SELECT PROVINCE, SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS Totalproprtyvalue
FROM [dbo].[Property_DATA]
WHERE PROPERTY_PRICE > 4000000
GROUP BY PROVINCE;
--20. What is the total minimum gross monthly income required per province?
SELECT * FROM [dbo].[Property_DATA];
SELECT PROVINCE, SUM(MIN_GROSS_MONTHLY_INCOME) AS TOTAL_MINI_GROSS_INCONE
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE;
--SECTION 3 – AVG Aggregations (10 Questions)
--21. What is the average property price overall?
SELECT * FROM [dbo].[Property_DATA];
SELECT AVG(CAST(property_price AS BIGINT)) AS AverageGautengValue
FROM [dbo].[Property_DATA]
WHERE province = 'Gauteng';  
--22. What is the average property price per province?
SELECT * FROM [dbo].[Property_DATA];
SELECT PROVINCE, AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS Average
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE
ORDER BY AVERAGE;
--23. What is the average property price per city?
SELECT CITY, AVG(CAST( PROPERTY_PRICE AS BIGINT)) AS AVERAGE
FROM  [dbo].[Property_DATA]
GROUP BY CITY 
--24. What is the average number of bedrooms per province?
SELECT * FROM [dbo].[Property_DATA]
SELECT PROVINCE, AVG(CAST(BEDROOMS AS BIGINT)) AS AVERAGEBEDROOMS
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE
ORDER BY AVERAGEBEDROOMS;
--25. What is the average number of bathrooms per province?
SELECT * FROM [dbo].[Property_DATA]
SELECT PROVINCE, AVG(CAST(BATHROOMS AS BIGINT)) AS AVERAGEBATHROOMS
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE
ORDER BY AVERAGEBATHROOMS;
--26. What is the average floor size per province?
SELECT * FROM  [dbo].[Property_DATA]
SELECT PROVINCE, AVG(CAST(FLOOR_SIZE AS BIGINT)) AS AVERAGE_FLOORSIZE
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE
ORDER BY AVERAGE_FLOORSIZE;
--27. What is the average monthly repayment per province?
SELECT * FROM [dbo].[Property_DATA]
SELECT PROVINCE, AVG(CAST(MONTHLY_REPAYMENT AS BIGINT)) AS AVERAGE_MONTHLY_REPAYMENT
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE;
--28. What is the average once-off cost per province?
SELECT * FROM [dbo].[Property_DATA]
SELECT PROVINCE, AVG(CAST( TOTAL_ONCE_OFF_COSTS AS BIGINT)) AS AVERAGE_ONCE_COSTS
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE;
--29. What is the average minimum gross monthly income per province?
SELECT * FROM [dbo].[Property_DATA]
SELECT PROVINCE, AVG(CAST(MIN_GROSS_MONTHLY_INCOME AS BIGINT)) AS AVERAGE
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE;
--30. What is the average property price for properties above R3,000,000?
SELECT * FROM [dbo].[Property_DATA]
SELECT  AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS AverageABOVE3000000
FROM [dbo].[Property_DATA]
WHERE CAST (PROPERTY_PRICE AS BIGINT) >3000000;
--SECTION 4 – GROUP BY + Filtering (10 Questions)
--31. Which province has the highest average property price?
SELECT * FROM  [dbo].[Property_DATA]
SELECT TOP 1 PROVINCE, SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS HighestPropertyPrice
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE
ORDER BY HighestPropertyPrice DESC;
--32. Which province has the lowest average property price?
SELECT * FROM [dbo].[Property_DATA]
SELECT TOP 1 PROVINCE, SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS LowestAverage
FROM [dbo].[Property_DATA]
GROUP BY PROVINCE
ORDER BY LowestAverage ASC;
--33. Which city has the highest total property value?
SELECT * FROM  [dbo].[Property_DATA]
SELECT   CITY, SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS highestvalue
FROM [dbo].[Property_DATA]
GROUP BY CITY
ORDER BY  highestvalue DESC;
--34. Which city has the lowest average property price?
SELECT * FROM [dbo].[Property_DATA]
SELECT CITY, AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS lowestaverage
FROM [dbo].[Property_DATA]
GROUP BY CITY
ORDER BY  lowestaverage ASC;
--35. How many properties per province are priced above R2,000,000?
SELECT * FROM  [dbo].[Property_DATA]
SELECT Province,COUNT(*) AS pricedabove2000000
FROM [dbo].[Property_DATA]
WHERE PROPERTY_PRICE > 2000000
GROUP BY Province
ORDER BY pricedabove2000000 DESC;
--36. What is the average floor size per province for properties above R3,000,000?
SELECT PROVINCE, AVG(CAST(FLOOR_SIZE AS BIGINT)) AS avgfloorsize
FROM [dbo].[Property_DATA]
WHERE PROPERTY_PRICE > 3000000
GROUP BY PROVINCE
ORDER BY avgfloorsize DESC;
--37. What is the total property value per province for properties with 3 or more bedrooms?
SELECT * FROM [dbo].[Property_DATA]
SELECT PROVINCE, SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS PROPERTYVALUE
FROM [dbo].[Property_DATA]
WHERE BEDROOMS > 3
GROUP BY PROVINCE
ORDER BY PROPERTYVALUE DESC;
--38. What is the average monthly repayment per province for properties above R4,000,000?
SELECT PROVINCE, ROUND(AVG(CAST(Monthly_Repayment AS FLOAT)), 2) AS AvgMonthlyRepayment
FROM [dbo].[Property_DATA]
WHERE PROPERTY_PRICE > 4000000
GROUP BY PROVINCE
ORDER BY AvgMonthlyRepayment DESC;
--39. How many properties per city have parking for 2 or more cars?
SELECT CITY, COUNT(*) AS PropertiesWith2OrMoreParking
FROM [dbo].[Property_DATA]
WHERE PARKING >= 2
GROUP BY CITY
ORDER BY PropertiesWith2OrMoreParking DESC;
--40. What is the average minimum gross monthly income per province for properties above R5,000,000?
SELECT PROVINCE, ROUND(AVG(CAST(Min_Gross_Monthly_Income AS FLOAT)), 2)
AS AvgMinGrossIncome
FROM [dbo].[Property_DATA]
WHERE PROPERTY_PRICE > 5000000
GROUP BY PROVINCE
ORDER BY AvgMinGrossIncome DESC;