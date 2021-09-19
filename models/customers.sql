with customers as (

    select * from {{ ref('stg_users') }}

),

purchases as (

    select * from {{ ref('stg_purchases') }}

),

items as (

    select * from {{ ref('stg_items') }}

),

customer_orders as (

    select
        user_id,
        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(purchase_id) as number_of_orders
    from purchases

    group by 1

),

purchase_detail as (
    select 
        purchases.*,
        items.category,
        items.price
    from purchases
    left join items 
    on purchases.item_id = items.item_id
),

customer_payments as (

    select
        purchase_detail.user_id,
        sum(price) as total_amount

    from purchase_detail
    where state = 1
    group by 1

),

final as (

    select
        customers.user_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        customer_orders.number_of_orders,
        customer_payments.total_amount as customer_lifetime_value

    from customers

    left join customer_orders using (user_id)

    left join customer_payments using (user_id)
    order by user_id
)

select * from final
