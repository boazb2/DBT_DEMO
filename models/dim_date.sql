with cte as (

select 
to_timestamp(started_at) started_at
,date(to_timestamp(started_at)) date_started_at
,hour(to_timestamp(started_at)) hour_started_at
,dayname(to_timestamp(started_at)) day_started_at
,{{day_type('started_at')}} day_type
,{{get_season('started_at')}}
from {{ source('demo', 'bike') }}    
where started_at != 'started_at'
)

select *
from cte