{% snapshot customers_snapshot %}

{{
    config(
        target_database='jaffle_shop_db',
        target_schema='dev',
        unique_key='id',
        strategy='check',
        check_cols=['first_name', 'last_name']
    )
}}

select
    id,
    first_name,
    last_name
from {{ source('jaffle_shop', 'raw_customers') }}

{% endsnapshot %}
