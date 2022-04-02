select
    id as payment_id,
    orderid as order_id,
    {{cents_to_dollars('amount')}},
    status,
    paymentmethod

from {{source('jaffle_shop','payments')}}

