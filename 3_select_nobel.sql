--Schema : yr, subject, winner

--1. noble prizes for 1950
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--2. 1962 winner in literature category
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

--3. Albert einstein winning year and subject
SELECT yr, subject 
FROM nobel
WHERE winner='Albert Einstein'

--4.peace winner from 2000
SELECT winner FROM nobel
WHERE yr>=2000 AND subject='peace'

--5. literature data from 1980-89
SELECT *
FROM nobel
WHERE yr BETWEEN 1980 and 1989  AND subject='literature';

--6. Show all details for presedential winners
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Thomas Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')


--7. First name John
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

--8. chemisty and physics from different year
SELECT *
FROM nobel
WHERE (subject='physics' AND  yr=1980) OR (subject='chemistry' AND yr=1984)

--9. exclude chemist and medics
SELECT * FROM nobel
WHERE yr=1980 AND subject NOT in ('chemistry','medicine');

--10. Early medicine late literature
SELECT * 
FROM nobel
WHERE (yr < 1910 AND subject='Medicine') OR 
(yr>=2004 AND subject='Literature')

