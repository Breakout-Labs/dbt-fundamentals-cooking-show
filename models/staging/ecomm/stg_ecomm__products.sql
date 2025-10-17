with source as (
    select
        *
    from {{ source('ecomm', 'products') }}
),

renamed as (
    select
        product_id,
        product_name,
        category,
        subcategory,
        unit_price,
        is_active,
        created_at
    from source
),

final as (
    select
        *
    from renamed
)

select
    *
from final