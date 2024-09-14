with products as (
    select
        id,
        category
    from {{ref('int_products')}}
),

product_category_price as (
    select
        product_id,
        sale_price
    from
        {{ref('cleaned_order_items')}}
    where
        status not in ('Returned','Cancelled')
),

ranked_categories as (
    select
        p.category,
        sum(pcp.sale_price) as total_revenue
    from
        product_category_price pcp
    join
        products p
    on
        p.id = pcp.product_id
    group by p.category
    order by total_revenue desc
    limit 5
)

select * from ranked_categories