WITH cleaned AS (
    SELECT order_id, num_of_items
    FROM {{ ref('cleaned_orders') }}
),
items AS (
    SELECT order_id, COUNT(*) AS num_of_items
    FROM {{ ref('cleaned_order_items') }}
    GROUP BY order_id
)
SELECT
    c.order_id
FROM cleaned c
JOIN items i ON c.order_id = i.order_id
WHERE c.num_of_items != i.num_of_items