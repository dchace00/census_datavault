{{ config(
    materialized='table',
    schema='refined'
) }}

SELECT
    DISTINCT geoid,
    geoname
FROM
    {{ source('stage', 'data') }}
