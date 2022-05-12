with source as (
    
    select * from {{ ref('raw_items') }}

),

renamed as (

    select
        id as item_id,
        price +1,
        category
    from source

)

select * from renamed
