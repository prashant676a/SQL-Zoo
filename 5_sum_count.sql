--Schema (World), :name, :continent, :area, :population, :gdp

--1.Total world population
SELECT SUM(population)
FROM world

--2.List all the unique continents name
SELECT DISTINCT continent
FROM world;

--3.gdp of africa
SELECT sum(gdp) as africa_gdp
FROM world
WHERE continent='Africa'

--4.count big countries
SELECT count(*) 
FROM world
WHERE area>1000000

--5. Blatic states population
SELECT sum(population)
FROM world
WHERE name in ('Estonia', 'Latvia', 'Lithuania')

--6. .Countries in each continent
SELECT continent, count(name)
FROM world
GROUP BY continent

--7. Counting big countries in each continent
SELECT continent , count(name)
FROM world
WHERE population > 10000000
GROUP BY continent

--8. counting big continents
SELECT continent
FROM world
GROUP BY continent
HAVING sum(population) > 100000000