
/* 
Runs macro on dim_listings_cleansed to validate no column names are null
*/
{{ no_nulls_in_columns(ref('dim_listings_cleansed'))}}
