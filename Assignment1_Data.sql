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

/* Total distance flown by all of the planes in January 2013 is 27188805 */
select sum(distance) as Total_Distance 
from flights
where year='2013' 
and month='1';

/* Total distance where tailnum is missing is 81763 */
select sum(distance) as Total_Distance 
from flights
where year='2013' 
and month='1'
and tailnum is null;



/* Question 3. What is the total distance flown for all planes on July 5, 
2013 grouped by aircraft manufacturer? Write this statement first using an 
INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare? */

/* With inner join*/ 
select pl.manufacturer, sum(fl.distance) as total_distance
from flights as fl
inner join planes as pl 
on fl.tailnum=pl.tailnum
where fl.year='2013' 
and fl.month='7'
and fl.day='5'
group by pl.manufacturer
order by pl.manufacturer;

/* With Outher join. 
Difference: With outher left join we can see total distance for fanufacturer without a name (NULL)*/
select pl.manufacturer, sum(fl.distance) as total_distance
from flights as fl
left outer join planes as pl 
on fl.tailnum=pl.tailnum
where fl.year='2013' 
and fl.month='7'
and fl.day='5'
group by pl.manufacturer
order by pl.manufacturer;



/* Question 4. Show me list of airline's full name departed from 
'John F Kennedy Intl' airport for the month of February 2013 */ 

select airports.name as airport_name, airlines.name as airline_name
from airports 
join flights
on airports.faa=flights.origin
join airlines
on flights.carrier=airlines.carrier 
where airports.name='John F Kennedy Intl'
and flights.origin='JFK'
and flights.year='2013'
and flights.month='2'
group by airlines.name;
