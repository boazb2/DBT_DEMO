with bike_cte as (

select distinct 
start_statio_id as station_id
,start_station_name as station_name
,start_lat as station_lat
,start_lng as station_lan
from {{ ref('stg_dim_bike') }}
where ride_id != 'ride_id'

)

select *
from bike_cte