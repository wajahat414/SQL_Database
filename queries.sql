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
