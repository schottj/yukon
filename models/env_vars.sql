with env_var as (
    select 
        '{{env_var("ENVIRONMENT")}}' as test_ev,
        '{{env_var("DBT_cloud_run_id", "DEV")}}' as run_id
    from {{ref('orders')}}
    where order_id = 86
)

Select * from env_var
