with stg_orders as (
    select
        order_id,
        user_id,
        status,
        gender,
        num_of_item,
        {{ time_travel('created_at', -10, 'year') }} as created_at_adjusted,
        {{ time_travel('shipped_at', 2, 'month') }} as shipped_at_adjusted,
        {{ time_travel('delivered_at', 9, 'day') }} as delivered_at_adjusted,
        {{ time_travel('returned_at', 15, 'day') }} as returned_at_adjusted
    from {{ ref('stg_orders') }}
)

select *
from stg_orders
