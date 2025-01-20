{{ config(
    materialized='table',
    schema='refined'
) }}

SELECT
    DISTINCT year
FROM
    {{ source('stage', 'data') }}
