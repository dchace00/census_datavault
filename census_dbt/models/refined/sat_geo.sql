{{ config(
    materialized='table',
    schema='refined'
) }}

SELECT
    g.geo_key,
    d.geounit
FROM
    {{ source('stage', 'data') }} d
    JOIN {{ ref('refined.hub_geo') }} g ON d.geoid = g.geoid AND d.geoname = g.geoname
GROUP BY
    g.geo_key,
    d.geounit
