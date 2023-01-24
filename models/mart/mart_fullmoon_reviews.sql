/*
Business wants to know if full moons are having an effect on peoples moods
- Process left joins Fct_reviews with full moon dates so all full moons can be identified 
*/

{{
    config(
        materialized = 'table'
    )
}}

WITH fct_reviews AS (
    SELECT * FROM {{ref('fct_reviews')}}
),

full_moon_dates AS (
    SELECT * FROM {{ref('seed_full_moon_dates')}}
)

SELECT
    r.*,
    CASE 
        WHEN fm.full_moon_date IS NULL THEN 'not full moon'
        ELSE 'full moon'
    END AS is_full_moon
FROM fct_reviews r 
LEFT JOIN full_moon_dates fm
on (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))

