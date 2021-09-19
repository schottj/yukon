with source as (
    select * from {{ ref('raw_users') }}

),

renamed as (

    select
        id as user_id,
        first_name,
        last_name,
        email, 
        language, 
        deactivated

    from source

)

select * from renamed
