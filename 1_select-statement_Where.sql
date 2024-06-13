-- schema: name, continent, area, population, gdp: table world

--1. Select name, continent, population
SELECT name, continent, population FROM world

--2. Atleast 200M population
SELECT name FROM world
WHERE population >= 200000000

--3. gdp percapita for countries with atleast 200M population
SELECT name, gdp/population as gdp_per_capita
FROM world
WHERE population >=200000000

--4. South American countries population in million
SELECT name,population/1000000 as population_in_Million
FROM world
WHERE continent='South America';


--5. name and population from france,italy,germany
SELECT name, population FROM world WHERE
name in ('France','Germany','Italy');


--6. Country name that includes United
SELECT name FROM world WHERE name LIKE '%United%';


--7. big country by population or area
SELECT name, population, Area fROM world
WHERE area > 3000000 OR population > 250000000; 

--8. EXCLUSIVE OR (NOT AND)
SELECT name, population , area
FROM world
WHERE (area>3000000 XOR population > 250000000)


--9. population in million and gdp in billion for South America
SELECT name, ROUND(population/1000000.0,2) as population_in_million, ROUND(gdp/1000000000.0,2) as gdp_in_billion
FROM world
WHERE name='South America';

--10. Rounding gdp to nearest 1000$ for countries over gdp 1 trillion
SELECT name, ROUND(gdp/population, -3) AS per_capita_gdp
FROM world
WHERE gdp >= 1000000000000;

--11. name and capital that have equal length
SELECT name, capital
  FROM world
WHERE LENGTH(name)=LENGTH(capital)

--12. name and capital first letter same but all not same
SELECT name, capital
FROM world
wHERE LEFT(name,1)=LEFT(capital,1) AND name <>capital;

--13. country contain all vowels but not space
SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'


