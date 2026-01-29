{{ config(
    materialized='incremental',
    keys='host_id'
    ) }}

select
   host_id,
   host_name,
   host_since,
   is_superhost,
   case 
      when response_rate >95 then 'very good'
      when response_rate >80 then 'good'
      when response_rate >60 then 'average'
      else 'poor'
   end as response_rate_quality,
   created_at
from {{ ref('bronze_hosts') }}
    