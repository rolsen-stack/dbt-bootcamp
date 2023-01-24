-- Part of course to override teh dbt_project.yml table setting to become a view

{{
    config(
        materialized = 'view'
    )
}}



WITH src_listing AS (
    SELECT * FROM {{ref('src_listings')}}
)
SELECT 
    listing_id,
    listing_name,
    room_type,
    CASE -- Adjusts invalid values of zero to business requirements of 1 night -> Feature F0001
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    REPLACE(
        price_str, '$'
    ) :: NUMBER(10, 2) AS price, -- Update price to be a number with 2 decimals of percision -> Feature F0002
    created_at,
    updated_at
    FROM
        src_listing



