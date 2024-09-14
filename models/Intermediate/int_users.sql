with stg_users as (
    select * from {{ ref('stg_users') }}
)

select
    id,
    first_name,
    last_name,
    email,
    age,
    gender,
    state,
    street_address,
    postal_code,
    city,
    country,
    latitude,
    longitude,
    traffic_source,
    {{ time_travel('created_at', 20, 'year') }} as created_at_adjusted
from
    stg_users