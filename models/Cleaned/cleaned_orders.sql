WITH c_ord AS (
    SELECT
        *,
        (SELECT COUNT(*) FROM {{ ref('cleaned_order_items') }} WHERE order_id = o.order_id) AS num_of_items
    FROM {{ ref('int_orders') }} AS o
)
SELECT * FROM c_ord