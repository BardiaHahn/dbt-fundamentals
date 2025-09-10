select
    order_id,
    sum(amount_in_usd) as total_amount_in_usd
from {{ ref('stg_stripe__payments') }}
group by 1
having total_amount_in_usd < 0