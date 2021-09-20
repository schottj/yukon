with items as (
    select * from {{ref('stg_items')}}
),
purchases as (
    select * from {{ref('stg_purchases')}}
),
items_purchased as (
    select 
        purchases.item_id,
        items.category,
        count(purchase_id) as total_number_purchased,
        sum(items.price) as total_amount_purchased,
        from items
        left join purchases on
        items.item_id = purchases.item_id
        where purchases.state = 1
        group by 1,2
)

select * from items_purchased