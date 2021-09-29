with items as (
    select * from {{ref('stg_items')}}
    limit 1
)
select 
'{{env_var("DBT_ENVIRONMENT","default")}}' as environment,
'{{env_var("DBT_CLOUD_RUN_ID","default")}}' as run_id
from items