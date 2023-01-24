
-- Listings cleansed CTE read
WITH l AS (
    SELECT * FROM {{ref("dim_listings_cleansed")}}
),

-- Hosts cleansed CTE read
h AS (
    SELECT * FROM {{ref('dim_hosts_cleansed')}}
)

SELECT 
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost as host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as updated_at -- Business requirement F0004, selects the most current updated date
FROM l 
LEFT JOIN h
ON (h.host_id = l.host_id) -- Not all hosts will have reviews, selects only those with reviews or reviews that do not have a host



