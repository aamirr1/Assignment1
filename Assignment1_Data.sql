/* Question 1. How many airplanes have listed speeds? What is the minimum 
listed speed and the maximum listed speed? */

/* 23 airplanes are listed speed. Minimum speed is 90. Maximum speed is 432*/ 
select count(*) as Speed_Listed, min(speed) as Minimum_Speed, 
max(speed) as Maximum_Speed
from planes 
where speed is not null;


/* Question 2. What is the total distance flown by all of the planes in January 2013? 
What is the total distance flown by all of the planes in January 2013 
where the tailnum is missing?

/* Total distance flown by all of the planes in January 2013 is 350217607 */
select sum(distance) as Total_Distance 
from flights;
where year='2013' 
and month='1';

/* Total distance where tailnum is missing is 350217607 */
select sum(distance) as Total_Distance 
from flights;
where year='2013' 
and month='1'
and tailnum is null;



/* Question 3. What is the total distance flown for all planes on July 5, 
2013 grouped by aircraft manufacturer? Write this statement first using an 
INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare? */

/* With inner join*/ 
select pl.manufacturer, fl.distance
from planes as pl
inner join flights as fl
where fl.year='2013' 
and fl.month='7'
and fl.day='5';
on pl.tailnum=fl.tailnum
group by pl.manufacturer

