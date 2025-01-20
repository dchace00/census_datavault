{{ config(
    materialized='table',
    schema='refined'
) }}

SELECT
    l.link_key,
    d.val,
    d.timestamp
FROM
    {{ source('stage', 'data') }} d
    JOIN {{ ref('refined.hub_var') }} v ON d.var_id = v.var_id AND d.product = v.product
    JOIN {{ ref('refined.hub_geo') }} g ON d.geoid = g.geoid AND d.geoname = g.geoname
    JOIN {{ ref('refined.link_year_geo_var') }} l ON d.year = l.year AND g.geo_key = l.geo_key AND v.var_key = l.var_key
