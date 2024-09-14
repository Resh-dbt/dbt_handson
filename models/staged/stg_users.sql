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
    TO_TIMESTAMP(REPLACE(created_at, ' UTC', ''), 'YYYY-MM-DD HH24:MI:SS.FF6') as created_at
from {{source('Snowflake', 'USERS') }}