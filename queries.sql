1 select basics
-SELECT population FROM world
  WHERE name = 'Germany'
-SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
-SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
Lesson1 select
SELECT name FROM world
  WHERE name LIKE 'y%'
  SELECT name FROM world
  WHERE name LIKE '%y'
  SELECT name FROM world
  WHERE name LIKE '%x%'
  SELECT name FROM world
  WHERE name LIKE '%land'
  SELECT name FROM world
  WHERE name LIKE 'C%ia%'
  SELECT name FROM world
  WHERE name LIKE '%oo%'
  SELECT name FROM world
  WHERE name LIKE '%a%a%a%'
  SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name
SELECT name FROM world
 WHERE name LIKE '%o__o%'
 
  
SELECT name FROM world
 WHERE name LIKE '____'
 SELECT name
  FROM world
 WHERE name LIKE capital
 
 SELECT name
  FROM world
 WHERE concat(name, ' City') LIKE capital
 SELECT capital,name
  FROM world
 WHERE capital LIKE concat('%',name,'%')

 SELECT capital,name
  FROM world
 WHERE capital LIKE concat(name,'_','%')
 SELECT name,REPLACE(capital,name,'') as ext
  FROM world
 WHERE capital LIKE concat(name,'_','%')

LESSON2: SELECT FROM WORLD
SELECT name, continent, population FROM world
SELECT name FROM world
WHERE population > 200000000
select name,GDP/population as per_capita_GDP from world where population > 200000000
select name,population/1000000 as population_in_million from world where continent LIKE 'South America'
select name,population  from world where name in ('France','Germany','Italy')
select name from world where name LIKE '%United%'
select name,population,area from world where area > 3000000 OR population > 250000000
select name,population,area from world where area > 3000000 XOR population > 250000000
select name,ROUND(population/1000000,2) as pop_in_million,ROUND(GDP/1000000000,2) from world where continent LIKE 'South America'     
select name,ROUND((gdp/population) / 1000) * 1000 as per_capita_gdp from world where GDP >1000000000000
SELECT name,capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)
 SELECT name,capital from world where LEFT(name,1) LIKE LEFT(capital,1) AND name <> capital
 SELECT name
   FROM world
WHERE name LIKE '%a%' and name LIKE '%e%' and name LIKE '%i%' and name LIKE '%o%' and name LIKE '%u%' and name not LIKE '%d%' and name not LIKE '%g%' 

Lesson 2 select from nobel
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
   select yr,subject from nobel where winner = 'Albert Einstein' 
   select  winner from nobel where subject = 'Peace' AND yr >= 2000 
   select yr,subject,winner from nobel where subject = 'Literature' AND yr >= 1980 AND yr <= 1989
   SELECT * FROM nobel
 WHERE winner in ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')
 select winner from nobel where winner LIKE 'John%'
 select yr,subject,winner from nobel where subject = 'Physics' AND yr =1980  OR subject = 'Chemistry' AND yr= 1984
 select * from nobel where yr =1980 and subject NOT IN ('Chemistry','Medicine')
 select * from nobel where subject = 'Medicine' and yr < 1910 or subject = 'Literature' AND yr >= 2004
 select * from nobel where winner LIKE 'PETER GRÜNBERG'
 select * from nobel where winner LIKE 'EUGENE O\'NEILL'
 select winner,yr,subject from nobel where winner LIKE 'Sir%' 
 SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject in ('Chemistry','Physics') asc,subject,winner 
 ///////////////////////////////////////////////////////////////////////////////////////////////////
LESSON 3 NESTED QUERIES
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Romania')
select name from world where continent='Europe' AND gdp/population > (select gdp/population from world where name='United Kingdom')
select name,continent  from world where  continent IN (select continent from world where name='Australia' or name ='Argentina') order by name
select name,population from world where population > (select population from world where name='Canada') And population < (select population from world where name='Poland')
select name,CONCAT(ROUND((100*population/(select population from world where name ='Germany'))),'%')as population from world where continent='Europe' order by name
select name from world where GDP > ALL (select GDP from world where continent = 'Europe' AND GDP > 0)
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
select continent,name  from world x where name = (select name from world y where x.continent=y.continent order by name LIMIT 1)

select name,continent,population from world where continent IN (select continent from world x where 25000000 >= ALL (select population from world y where x.continent=y.continent))
select name,continent from world x where population/3 >= ALL (select population from world y where x.continent=y.continent AND x.name != y.name)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
Lesson 4 SUM AND COUNT
SELECT SUM(population)
FROM world
select distinct(continent ) from world

select COUNT(name) as number_OF_COUNTRIES from world where area > 1000000
select SUM(population) from world where name IN ('Estonia', 'Latvia', 'Lithuania')
select continent,COUNT(name) from world where population >= 10000000 group by continent 
select continent from world  group by continent having SUM(population) > 100000000
///////////////////////////////////////////////////////////
LESSON 5 JOIN
SELECT matchid,player FROM goal 
  WHERE teamid LIKE 'GER'
SELECT id,stadium,team1,team2
  FROM game where id=1012
SELECT player,teamid,stadium,mdate
  FROM game INNER JOIN goal ON (game.id=goal.matchid) where goal.teamid='GRE'

  select team1,team2,player from game JOIN goal on id=matchid where player LIKE 'Mario%'
  SELECT player, teamid,coach, gtime
  FROM goal JOIN eteam on teamid=id 
 WHERE gtime<=10
 select mdate,teamname from game JOIN eteam on eteam.id=team1 where coach = 'Fernando Santos'
 select player from goal JOIN game ON game.id=goal.matchid where stadium = 'National Stadium, Warsaw'
 SELECT DISTINCT(player)
  FROM game JOIN goal ON matchid = id 
    WHERE (goal.teamid!='GER' AND team1='GER' XOR team2='GER')
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON id=teamid GROUP BY teamname
  select stadium,COUNT(*) from game JOIN goal on id=matchid group by stadium
   SELECT matchid,mdate,COUNT(teamid)
  FROM game JOIN goal ON matchid = id  
 where (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid,mdate
 select matchid,mdate,COUNT(matchid) from goal JOIN game on id=matchid where teamid='GER' GROUP BY matchid,mdate
 SELECT mdate,
  team1,SUM(
  CASE WHEN teamid=team1 THEN 1 ELSE 0 END) as score1,team2,SUM(
  CASE WHEN teamid=team2 THEN 1 ELSE 0 END) as score2
  FROM game LEFT JOIN goal ON matchid = id GROUP BY mdate,matchid,team1,team2
  //////////////////////////////////////////////////////////////////////////////
  LESSON 6 MORE JOIN OPERATION
  SELECT id, title
 FROM movie
 WHERE yr=1962
  SELECT yr
 FROM movie
 WHERE title='Citizen Kane'
 select id,title,yr from movie where title LIKE 'Star Trek%' order by yr
 select id from actor where name='Glenn Close'
 select id from movie where title='Casablanca'


select name from actor JOIN casting JOIN movie ON actor.id=actorid AND movie.id=movieid where title= 'Casablanca'


select name from actor JOIN casting JOIN movie ON actor.id=actorid AND movie.id=movieid where title= 'Alien'


select title from movie JOIN casting JOIN actor ON movie.id=movieid AND actor.id=actorid where name='Harrison Ford'


select title from movie JOIN casting JOIN actor ON movie.id=movieid AND actor.id=actorid where name='Harrison Ford' AND ord!=1


select title,name from movie JOIN casting JOIN actor ON movie.id=movieid AND actor.id=actorid where yr=1962 AND ord=1
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
select title,name from movie JOIN casting ON movie.id=movieid JOIN actor ON actor.id=actorid where movieid IN (select movieid from casting  where actorid= (select id from actor where name='Julie Andrews')) AND ord=1
select name from actor where id IN (select actorid from casting where ord=1 GROUP BY actorid having COUNT(actorid) >= 15) order by name
select title,COUNT(movieid) as num_of_actors from casting JOIN movie on movieid=id where yr=1978 GROUP BY movieid,title order by num_of_actors DESC,title

select name from actor JOIN casting ON actor.id=actorid where movieid IN (
select movieid from casting where actorid = (select id from actor where name='Art Garfunkel')) AND name!='Art Garfunkel'
