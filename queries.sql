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
