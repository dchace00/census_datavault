{{ config(
    materialized='table',
    schema='refined'
) }}

SELECT
    DISTINCT d.year,
    g.geo_key,
    v.var_key
FROM
    {{ source('stage', 'data') }} d
    JOIN {{ ref('refined.hub_geo') }} g ON d.geoid = g.geoid AND d.geoname = g.geoname
    JOIN {{ ref('refined.hub_var') }} v ON d.var_id = v.var_id AND d.product = v.product
