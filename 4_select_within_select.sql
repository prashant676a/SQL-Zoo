--Schema: (world) name, continent, area, population, gdp

--1. population larger than russia
SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia')

--2.countries with per capits gdp greter than uk in europe
SELECT name 
FROM world
WHERE continent='Europe' AND gdp/population > (SELECT gdp/population FROM world
WHERE name='United Kingdom')

--3. Neighbors of argentina and australia
SELECT name, continent
FROM world
WHERE continent in (
SELECT continent FROM world WHERE name IN ('Argentina','Australia')
)
ORDER BY name;


--4. Population between Uk and Germany
SELECT name, population 
FROM world
WHERE population >
(SELECT population FROM world WHERE name='United Kingdom')
AND population <
(SELECT population FROM world WHERE name='Germany')


--5.Percentages of Germany
SELECT name, CONCAT(ROUND(population * 100/ (SELECT population FROM world WHERE name='Germany') , 0), '%') as percentage
FROM world
WHERE continent='Europe'

--6. gdp bigger than ever country in europe
SELECT name 
FROM world
WHERE gdp > ALL(SELECT gdp from world where gdp>0 and continent='Europe')
--(using list ) 
--: (using aggregate)
SELECT name 
FROM world
WHERE gdp > (SELECT max(gdp) from world Where continent='Europe')


--7.Largest in each continent
SELECT continent, name, area 
 FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
         AND area > 0 )
;

--8.First country of Each continent(alphabatically)
SELECT continent,name FROM world x
  WHERE x.name <= ALL (
    SELECT name FROM world y
     WHERE x.continent=y.continent)
;


--9. continets withall country greater than 25M population 
SELECT name,continent,population FROM world x
  WHERE 25000000 >= ALL (
    SELECT population FROM world y
     WHERE x.continent=y.continent
       AND y.population>0)
;

--10. three times bigger country than all neighbors
SELECT name, continent FROM world x WHERE
 population > ALL
 (SELECT population*3 FROM world y
 WHERE y.continent = x.continent
 AND y.name != x.name)
;
