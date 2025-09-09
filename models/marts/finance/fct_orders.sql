with payments as (
    select * from {{ ref('stg_stripe__payments') }}
),
orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
)
SELECT order_id, customer_id, order_date, amount_in_usd AS amount, SUM(amount_in_usd) OVER (PARTITION BY customer_id) AS lifetime_value
FROM orders JOIN payments USING(order_id)
WHERE success = TRUE