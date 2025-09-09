SELECT
    orderid AS order_id,
    amount/100 AS amount_in_usd,
    status = 'success' AS success
FROM {{ source('stripe', 'payment') }}
