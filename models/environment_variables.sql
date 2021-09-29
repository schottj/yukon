select 
"{{env_var('DBT_ENVIRONMENT','default')}}" as environment,
"{{env_var('DBT_CLOUD_RUN_ID','default')}}" as run_id