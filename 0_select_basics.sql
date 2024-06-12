-- The Schema of table world
-- name,continent, area, population, gdp

--1. Show population of germany
SELECT population FROM world
WHERE name = 'Germany';


--2. Show name, population for 'Sweden','NOrway', 'Denmark'
SELECT name, population FROM world
  WHERE name IN ('Sweden','Norway','Denmark');

--3. (not to small and big countries)
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
