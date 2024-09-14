with
    ranked_order_items as (
        select
            id,
            order_id,
            user_id,
            product_id,
            status,
            sale_price,
            created_at_adjusted,
            returned_at_adjusted,
            shipped_at_adjusted,
            delivered_at_adjusted,
            row_number() over (
                partition by order_id, product_id order by created_at_adjusted desc
            ) as rank
        from {{ ref('int_order_items') }}
    )

select *
from ranked_order_items
where rank = 1
