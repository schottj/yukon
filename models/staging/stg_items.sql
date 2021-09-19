with source as (
    
    select * from {{ ref('raw_items') }}

),

renamed as (

    select
        id as item_id,
        category,
        price
    from source

)

select * from renamed
