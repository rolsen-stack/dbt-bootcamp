-- Part of course to override teh dbt_project.yml table setting to become a view

{{
    config(
        materialized = 'view'
    )
}}



WITH src_hosts AS (
    SELECT * FROM {{ref('src_hosts')}}
)
SELECT
    host_id,
    NVL(host_name, 'Anonymous') AS host_name, -- Business requirement F0003
    is_superhost, -- Confirm with business, when host_name is null, all is_superhost is null
    created_at,
    updated_at

FROM src_hosts
