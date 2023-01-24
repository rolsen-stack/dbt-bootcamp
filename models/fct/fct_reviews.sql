/*
Incremental build table:
Set to fail if any upstream schemas change so we are alerted
*/
{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}
WITH src_reviews AS (
    SELECT * FROM {{ref("src_reviews")}}
)

SELECT 
{{ dbt_utils.surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} as review_id,
*
FROM src_reviews
WHERE review_text is not null
-- Jinja if statement
-- - Checks if the input is on a incremental load, then only append the most current data from the CTE. Explore this more
{% if is_incremental() %}
    AND review_date > (SELECT max(review_date) FROM {{this}})
{% endif %}
