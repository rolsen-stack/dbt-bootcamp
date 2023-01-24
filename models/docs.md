{% docs dim_listing_cleansed_minimum_nights %}

Minimum number of nights requried to rent this property.

Keep in mind that old listings might have 'minimum_nights' set to 0 in the source table. Cleansing process updates these values to '1'.

{% enddocs %}


{% docs fct_reviews_documentation %}

Fact table for Airbnb reviews. Table incrementally loads in all new reviews from scr_reviews where the review_date > max(review_date). 
Snapshot has been created:
Config = (
        target_schema = 'dev',
        unique_key = 'id',
        strategy = 'timestamp',
        updated_at = 'updated_at',
        invalidate_hard_deletes = True
)
- Scheduled snapshot updating has not been configured


REVIEW_ID (Primary Key): 
Created from surragate key: ['listing_id', 'review_date', 'reviewer_name', 'review_text']
Creates a uninque hash key for each review.

{% enddocs %}



{% docs fct_reviews_review_id_doc %}

Primary Key: 
Created from surragate key: ['listing_id', 'review_date', 'reviewer_name', 'review_text']
Creates a uninque hash key for each review.

{% enddocs %}