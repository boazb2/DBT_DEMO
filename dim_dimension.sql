with cte as (
select started_at
from {{ source('demo', 'bike') }}
)

select *
from cte