WITH raw_reviews AS (
SELECT * FROM {{ source('airbnb', 'reviews')}}
)

SELECT
    listing_id,
    "DATE" AS review_date,
    comments AS review_text,
    sentiment AS review_sentiment,
    reviewer_name
    
FROM raw_reviews

    