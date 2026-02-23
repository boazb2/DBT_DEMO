with cte as (

select 
to_timestamp(started_at) started_at
,date(to_timestamp(started_at)) date_started_at
,hour(to_timestamp(started_at)) hour_started_at
,dayname(to_timestamp(started_at)) day_started_at
,case when dayname(to_timestamp(started_at)) in ('Sat','Fri') then 'Weekend' else 'Business day' end day_type
,case when month(to_timestamp(started_at)) in (12,1,2) then 'Winter'
      when month(to_timestamp(started_at)) in (3,4,5) then 'Spring'
      when month(to_timestamp(started_at)) in (6,7,8) then 'Summer'
      else 'Autom' end station_of_year 

from {{ source('demo', 'bike') }}    
where started_at != 'started_at'
)

select *
from cte