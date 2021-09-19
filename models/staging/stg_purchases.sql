with source as (

    select * from {{ ref('raw_purchases') }}

),

renamed as (

    select
        id as purchase_id,
        user_id,
        datetime as order_date,
        item_id,
        state
    from source

)

select * from renamed
