with order_items as (
    select
        id,
        order_id,
        product_id,
        user_id,
        status,
        sale_price,
        {{ time_travel('created_at', 7, 'day') }} as created_at_adjusted,
        {{ time_travel('shipped_at', 5, 'month') }} as shipped_at_adjusted,
        {{ time_travel('delivered_at', 10, 'year') }} as delivered_at_adjusted,
        {{ time_travel('returned_at', 10, 'year') }} as returned_at_adjusted
    from {{ ref('stg_order_items') }}
)
select * 
from order_items