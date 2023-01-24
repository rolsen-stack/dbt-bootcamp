-- Jinja tags for creating a snapshot

--Snapshot table name
{% snapshot scd_raw_listings %} 

-- Target schema of the snaphot
-- Invalidating_hard_deletes -> Any record deleted from the original input table, snapshot will refect and show a null row. 
--      With set to False, will be fully removed. Look into this more for CCPA compliance 
{{
    config(
        target_schema = 'dev',
        unique_key = 'id',
        strategy = 'timestamp',
        updated_at = 'updated_at',
        invalidate_hard_deletes = True
    )
}}


SELECT * FROM {{ source('airbnb', 'listings')}}

{% endsnapshot %}
