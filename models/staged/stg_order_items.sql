
select
    id,
    order_id,
    user_id,
    product_id,
    status,
    sale_price,
    TO_TIMESTAMP(REPLACE(created_at, ' UTC', ''), 'YYYY-MM-DD HH24:MI:SS.FF6') as created_at,
    TO_TIMESTAMP(REPLACE(returned_at, ' UTC', ''), 'YYYY-MM-DD HH24:MI:SS.FF6') as returned_at,
    TO_TIMESTAMP(REPLACE(shipped_at, ' UTC', ''), 'YYYY-MM-DD HH24:MI:SS.FF6') as shipped_at,
    TO_TIMESTAMP(REPLACE(delivered_at, ' UTC', ''), 'YYYY-MM-DD HH24:MI:SS.FF6') as delivered_at	
from {{source('Snowflake', 'ORDER_ITEMS')}}