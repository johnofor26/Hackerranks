-- QUESTION 1 Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
SELECT *
FROM CITY
WHERE CountryCode = 'USA' AND Population > 100000;

-- QUESTION 2 Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000

-- QUESTION 3 Query all columns (attributes) for every row in the CITY table.
SELECT ID, NAME, COUNTRYCODE, DISTRICT, POPULATION 
FROM CITY

-- QUESTION 4 Query all columns for a city in CITY with the ID 1661.
SELECT ID, NAME, COUNTRYCODE, DISTRICT, POPULATION
FROM CITY
WHERE ID = 1661

-- QUESTION 5 Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT ID, NAME, COUNTRYCODE, DISTRICT, POPULATION
FROM CITY
WHERE COUNTRYCODE = 'JPN'

-- QUESTION 6 Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = ‘JPN’

-- QUESTION 7 Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE
FROM STATION

-- QUESTION 8 Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID,2)= 0

-- QUESTION 9 Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
        FROM STATION
        
-- QUESTION 10 Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
(SELECT CITY, LENGTH (CITY) AS C_L
FROM STATION
ORDER BY C_L ASC, CITY ASC LIMIT 1)
UNION
(SELECT CITY, LENGTH (CITY) AS C_L
FROM STATION
ORDER BY C_L DESC, CITY ASC LIMIT 1)


-- QUESTION 11 Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION
WHERE CITY RLIKE ‘^[aeiouAEIOU]'

-- QUESTION 12 Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION
WHERE CITY RLIKE '[aeiouAEIOU]$'

-- QUESTION 13 Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION
WHERE  city REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$'

-- QUESTION 14 Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION
WHERE CITY NOT RLIKE '^[aeiouAEIOU]'

-- QUESTION 15 Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION
WHERE CITY NOT RLIKE '[aeiouAEIOU]$'


-- QUESTION 16 Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION
WHERE  city NOT RLIKE '^[aeiouAEIOU].*[aeiouAEIOU]$'

-- QUESTION 17 Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION
WHERE  city RLIKE '^[^aeiouAEIOU].*[^aeiouAEIOU]$'


-- QUESTION 18 Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(Name, 3), ID ASC;

-- QUESTION 19 Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT NAME
FROM EMPLOYEE
ORDER BY NAME ASC


-- QUESTION 20 Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID ASC


-- QUESTION 21 Query a count of the number of cities in CITY having a Population larger than .
SELECT COUNT(ID)
FROM CITY
WHERE POPULATION > 100000


-- QUESTION 22 Query the total population of all cities in CITY where District is California.
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'


-- QUESTION 23 Query the average population of all cities in CITY where District is California.
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'


-- QUESTION 24 Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT FLOOR (AVG(POPULATION))
FROM CITY

-- QUESTION 25 Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN'


-- QUESTION 26 Query the difference between the maximum and minimum populations in CITY.
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY


-- QUESTION 27 Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
SELECT ceil(avg(salary) - avg(replace(salary,'0',''))) 
FROM EMPLOYEES



-- QUESTION 28 We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
SELECT SALARY*MONTHS AS MTE, COUNT(*)
FROM EMPLOYEE
GROUP BY MTE
ORDER BY MTE DESC LIMIT 1

 
-- QUESTION 29 Query the following two values from the STATION table:
	1	The sum of all values in LAT_N rounded to a scale of  decimal places.
	2	The sum of all values in LONG_W rounded to a scale of  decimal places.

SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2)
FROM STATION


-- QUESTION 30 Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than . Truncate your answer to  decimal places.
SELECT ROUND(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345


