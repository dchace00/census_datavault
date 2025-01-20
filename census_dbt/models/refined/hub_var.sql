{{ config(
    materialized='table',
    schema='refined'
) }}

SELECT
    DISTINCT var_id,
    product
FROM
    {{ source('stage', 'data') }}
