with env_var as (
    select 
        '{{env_var("KEY","CODE")}}' as test_ev,
        '{{env_var("DBT_CLOUD_RUN_ID", "DEV")}}' as run_id,
        '{{env_var("DBT_ENV_SECRET_GIT_TOKEN", "TOKEN")}}' as token
    from {{ ref('stg_orders') }}
)

Select * from env_var