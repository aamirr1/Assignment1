
/* Show me American Airline's average departure delay accross the three New York airports in 2013 */

select year, carrier, origin, month, avg(dep_delay) as average_delay
from flights
where origin in ('JFK', 'LGA', 'EWR')
and carrier='AA'
and year='2013'
and dep_delay>0
group by origin, month
order by origin, month;