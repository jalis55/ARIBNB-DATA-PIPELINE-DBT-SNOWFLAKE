{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH listings AS 
(
    SELECT 
        LISTING_ID,
        CITY,
        COUNTRY,
        PRICE_PER_NIGHT_TAG,
        LISTING_CREATED_AT
    FROM 
        {{ ref('obt') }}
)
SELECT * FROM listings