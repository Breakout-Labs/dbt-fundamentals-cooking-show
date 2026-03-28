with products as (
    select
        *
    from {{ ref('stg_ecomm__products') }}
),

unnested as (
    select
        products.product_id,
        products.product_name,
        variant.index as variant_index
    from products,
        lateral flatten(input => products.variants) as variant
),

final as (
    select
        *
    from unnested
)

select
    *
from final

/*
SELECT
  p.id                        AS product_id,
  p.name                      AS product_name,
  v.index                     AS variant_index,             -- position in the array
  v.value:variant_id::string  AS variant_id,
  v.value:title::string       AS variant_title,
  v.value:color::string       AS color,
  v.value:size::string        AS size,
  v.value:length_m::number    AS length_m,
  v.value:capacity_persons::number AS capacity_persons
FROM raw.ecomm.products p,
     LATERAL FLATTEN(input => p.variants) v
ORDER BY p.id, v.index;
*/