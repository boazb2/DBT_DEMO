with daily_weather as (
select 
date(time) date_weather
,clouds
,humidity
,pressure
,temperature
,weather

from {{ source('demo', 't_weather') }}

)
,
daily_weather_agg as (
select date_weather
,weather
,round(avg(clouds),2) avg_clouds
,round(avg(humidity),2) avg_humidity
,round(avg(pressure),2) avg_pressure
,round(avg(temperature),2) avg_temperature

from daily_weather
group by date_weather
,weather
qualify row_number() over (partition by date_weather order by count(weather) desc ) =1
)

select *
from daily_weather_agg