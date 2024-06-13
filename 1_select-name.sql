--Schema: name, continent

--1. country name that starts with Y
SELECT name FROM world
  WHERE name LIKE 'Y%'


--2. country that end with y
SELECT name FROM world
  WHERE name LIKE '%y'


--3.country that contains letter x
SELECT name FROM world
  WHERE name LIKE '%x%'

--4. Countries that end with land
SELECT name FROM world
  WHERE name LIKE '%x%'

--5. Start with C and end with ia
SELECT name FROM world
  WHERE name LIKE 'C%ia'

--6. with letter oo
SELECT name FROM world
  WHERE name LIKE '%oo%'

--7. Three or more a in name
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

--8. t as second character
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name


--9. 2 o separated by two other character
SELECT name FROM world
 WHERE name LIKE '%o__o%'

--10. length of country name 4
SELECT name FROM world
 WHERE LENGTH(name)=4;

--11. name of country with same capital name
SELECT name
  FROM world
 WHERE name = capital

--12. capital name = name + city
SELECT name
  FROM world
 WHERE capital LIKE Concat(name, ' City');


--13. capital includes name of country
SELECT capital,name
FROM world
WHERE capital LIKE Concat('%',name, '%')


--14. capital extension of country name but not exactly same
SELECT capital, name
FROM world
WHERE capital LIKE Concat(name, '%') AND capital<>name

--15. Show proper extension of country capital 
SELECT name,
REPLACE(capital, name, '') as extension
FROM world
WHERE capital LIKE CONCAT(name, '%') 
  AND capital <> name
