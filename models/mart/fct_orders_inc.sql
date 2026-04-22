{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
) }}

SELECT
    o.order_id,
    o.customer_id,
    oi.order_value,
    o.order_date

FROM {{ ref('stg_orders') }} o
JOIN (

    SELECT
        order_id,
        SUM(quantity * price) AS order_value
    FROM {{ ref('stg_order_items') }}
    GROUP BY order_id

) oi
ON o.order_id = oi.order_id


{% if is_incremental() %}

WHERE o.order_id IN (
    SELECT order_id FROM {{ ref('stg_orders') }}
)

{% endif %}