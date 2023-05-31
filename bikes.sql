--Knowing columns type
use bikes_cycle 
select 
column_NAME,
data_type
from INFORMATION_SCHEMA.columns

--union all tables in one view table
create view bikes as select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bike_v1 union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bike_v2
union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bikes_v3
union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bikes_v4
union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bikes_v5
union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bikes_v6
union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bikes_v7
union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bikes_v8
union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bikes_v9
union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bikes_v10
union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bikes_v11
union
select ride_id, rideable_type,started_at , ended_at ,member_casual from bikes_cycle.dbo.bikes_v12

--cheking null values
select * from bikes
where ride_id is null or rideable_type is null or member_casual is null

--Data Exploration
select *from bikes

select member_casual , cast(cast(avg(cast((ended_at - started_at)as float))as datetime)as time) as avg_time
from bikes
group by member_casual
--calculating the averge time taken for member & casual
select member_casual , count(ride_id) as people_count
from bikes
group by member_casual

--calculating the averge time taken for each type of bikes
select rideable_type , member_casual,cast(cast(avg(cast((ended_at - started_at)as float))as datetime)as time) as time_taken  
from bikes
group by rideable_type , member_casual
order by member_casual
 -- comparing number of annual members and casual members in each type of bikes 
select rideable_type , member_casual,count(ride_id) as people_numbers  
from bikes
group by rideable_type , member_casual
order by member_casual

-- calculating number of annual members and casual members during the week 


select FORMAT(started_at,'ddd') as day_week , count(ride_id) as set_of_people,
member_casual from bikes
group by FORMAT(started_at,'ddd') , member_casual
order by  member_casual, day_week

--calculating the average time taken for annual members and casual members during the week

select FORMAT(started_at,'ddd') as day_week , cast(cast(avg(cast((ended_at - started_at)as float))as datetime)as time) as avg_time_taken,
member_casual from bikes
group by FORMAT(started_at,'ddd') , member_casual
order by  member_casual, day_week



