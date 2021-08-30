with env_var as (
    select 
        '{{env_var("ENVIRONMENT")}}' as test_ev,
        '{{env_var("DBT_CLOUD_RUN_ID", "DEV")}}' as run_id
    from dual
)

Select * from env_var