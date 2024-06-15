--(game) Schema: id, mdate, stadium, team1, team2
--(goal) Schema: matchid, teamid, player, gtime
--(eteam) Schema: id, teamname, coach

--1. goal by german player
SELECT matchid,player FROM goal 
  WHERE teamid='GER'

--2. 
SELECT DISTINCT id,stadium,team1,team2
  FROM game JOIN goal
ON game.id=goal.matchid
WHERE game.id=1012

--3.
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid='GER'


--4.
SELECT team1, team2,player
FROM game JOIN goal
ON game.id=goal.matchid
WHERE player LIKE 'Mario%'

--5.
SELECT player, teamid,coach,  gtime
  FROM goal JOIN eteam
ON goal.teamid=eteam.id
WHERE gtime<=10

--6..
SELECT mdate,teamname
FROM game g JOIN eteam e
ON g.team1=e.id
WHERE e.coach LIKE 'Fernando%'


--7.
SELECT player
FROM goal JOIN game
on goal.matchid=game.id
WHERE stadium IN ('National Stadium, Warsaw')

--8..
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE teamid<>'GER' AND (team2='GER' OR team1='GER')

--9.
SELECT teamname, COUNT(teamid)
FROM goal JOIN eteam
ON goal.teamid=eteam.id
GROUP BY teamname

--10
SELECT stadium, count(*) as goal_count
from game JOIN goal
ON game.id=goal.matchid
GROUP BY stadium

--11..
SELECT matchid,mdate, COUNT(*) as goals_count
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid,mdate

--12.
SELECT matchid,mdate, COUNT(*) as goals_count
  FROM game JOIN goal ON matchid = id 
WHERE teamid='GER'
GROUP BY matchid,mdate

--13.
SELECT 
  mdate,
  team1,
  SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
FROM 
  game
  JOIN goal ON game.id = goal.matchid
GROUP BY 
  mdate, team1, team2
ORDER BY 
  mdate, matchid,team1, team2;

