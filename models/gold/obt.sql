{% set configs=[
    {
        'table_name': 'airbnb.silver.silver_bookings',
        'columns':'bookings.*',
        'alias': 'bookings'
    },
    {
        'table_name': 'airbnb.silver.silver_listings',
        'columns':'listings.host_id,listings.city,listings.country,listings.accommodates,listings.bedrooms,listings.bathrooms,listings.price_per_night,listings.price_per_night_tag,listings.created_at as listing_created_at',
        'alias': 'listings',
        'join_condition': 'bookings.listing_id = listings.listing_id'
    },
    {
        'table_name': 'airbnb.silver.silver_hosts',
        'columns':'hosts.host_name,hosts.host_since,hosts.is_superhost,hosts.response_rate_quality,hosts.created_at as host_created_at',
        'alias': 'hosts',
        'join_condition': 'listings.host_id = hosts.host_id'
    }
] %}


select 
{% for config in configs %}
    {{ config.columns }}
    {% if not loop.last %},{% endif %}
{% endfor %}
from 
{% for config in configs %}
    {% if loop.first %}
        {{ config.table_name }} as {{ config.alias }}
    {% else %}
    left join {{ config.table_name }} as {{ config.alias }}     
    on {{config.join_condition}}
    {% endif %}
{% endfor %}
