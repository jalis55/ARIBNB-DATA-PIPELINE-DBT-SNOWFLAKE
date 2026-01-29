
{% set obt_columns = [
    "BOOKING_ID", "LISTING_ID", "HOST_ID", "TOTAL_AMOUNT", 
     "ACCOMMODATES", "BEDROOMS", 
    "BATHROOMS", "PRICE_PER_NIGHT"
] %}

SELECT 
    {{ obt_columns | join(', ') }}
FROM AIRBNB.GOLD.OBT