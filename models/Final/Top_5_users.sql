with user_spending as (
    select
        u.id as user_id,
        u.first_name,
        u.last_name,
        sum(co.sale_price) as total_amount_spent
    from {{ ref('cleaned_order_items') }} co  
    join {{ ref('int_users') }} u on co.user_id = u.id  
    where co.status not in ('Cancelled', 'Returned')
    group by u.id, u.first_name, u.last_name
),

ranked_users as (
    select
        first_name,
        last_name,
        total_amount_spent,
        row_number() over (order by total_amount_spent desc) as rank
    from user_spending
)

select
    first_name,
    last_name,
    total_amount_spent
from ranked_users
where rank <= 5