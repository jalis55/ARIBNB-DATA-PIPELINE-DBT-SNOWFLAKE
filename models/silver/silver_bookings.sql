{{ config(
    materialized='incremental',
    keys='booking_id'
    
    )
 }}

select 
  booking_id,
  listing_id,
  booking_date,
  {{ multiply('nights_booked','booking_amount') }} + cleaning_fee + service_fee as total_amount,
  booking_status,
  created_at
    
 from {{ ref('bronze_bookings') }}