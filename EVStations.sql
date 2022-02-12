-- looking at the table
select *
from EVChargerProject..ev_stations

-- deleting Washington DC, Ontario, and Puerto Rico from table.
delete from EVChargerProject..ev_stations
where state = 'ON' 
	or state = 'PR' 
	or state = 'DC'

-- looking at states with the most EV stations
select distinct State, count(*) as 'EV Stations'
from EVChargerProject..ev_stations
group by state
order by count(*) desc

-- Looking at states with the least amount of EV stations
select distinct State, count(*) as 'EV Stations'
from EVChargerProject..ev_stations
group by state
order by count(*) asc

-- looking at cities with the most EV stations
select distinct City, count(*) as 'EV Stations'
from EVChargerProject..ev_stations
group by City
order by count(*) desc

-- looking at states with the most public EV Stations
select distinct State, count(*) as 'Public EV Stations'
from EVChargerProject..ev_stations
where [Groups With Access Code] = 'Public'
group by state
order by count(*) desc

-- Looking at states w/ most EV station that are open 24 hours a day
select distinct State, count(*) as '24 Hour EV Stations'
from EVChargerProject..ev_stations
where [Access Days Time] = '24 hours daily' 
group by state
order by count(*) desc

-- Looking at the distinct facility types that have the most EV stations
select distinct [Facility Type], count(*) as 'EV Stations'
from EVChargerProject..ev_stations
where [Facility Type] is not null 
group by [Facility Type]
order by count(*) desc

--Looking at how many EV Stations having record of opening in the last 10 years
select distinct State, count(*) as 'EV Stations'
from EVChargerProject..ev_stations
where [Facility Type] is not null
	and [Open Date] between '2012-01-01' and '2022-01-01'
group by state
order by count(*) desc





