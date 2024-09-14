with stg_products as (
    select
        id,
        cost,
        category,
        name,
        brand,
        retail_price,
        department,
        sku,
        distribution_center_id
    from {{ ref('stg_products') }}
)
select * from stg_products