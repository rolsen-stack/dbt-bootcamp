/*
check to make sure no view date is submitted before it's listing was created.
- Ensures every_review date in fct_reviews is more recent than the associated created_at in dim_listings_cleansed

*/

SELECT fr.listing_id, fr.review_text
FROM {{ref('fct_reviews')}} fr
JOIN {{ref('dim_listings_cleansed')}} dlc
ON (fr.listing_id = dlc.listing_id)
WHERE fr.review_date < dlc.created_at