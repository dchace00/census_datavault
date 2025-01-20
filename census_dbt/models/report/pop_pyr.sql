{{ config(
    materialized='table',
    schema='report'
) }}

SELECT 
    l.link_key, 
    l.year, 
    l.geo_key, 
    l.var_key, 
    sv.var_label, 
    s.val AS count
FROM 
    {{ ref('refined.sat_year_geo_var') }} s
JOIN 
    {{ ref('refined.link_year_geo_var') }} l ON s.link_key = l.link_key 
JOIN 
    {{ ref('refined.sat_var') }} sv ON l.var_key = sv.var_key
JOIN 
    {{ ref('refined.hub_var') }} hv ON l.var_key = hv.var_key 
WHERE 
    hv.var_id IN (
        -- var_id for male population counts by age
        'S0101_C03_002E', 'S0101_C03_003E', 'S0101_C03_004E', 'S0101_C03_005E', 'S0101_C03_006E',
        'S0101_C03_007E', 'S0101_C03_008E', 'S0101_C03_009E', 'S0101_C03_010E', 'S0101_C03_011E',
        'S0101_C03_012E', 'S0101_C03_013E', 'S0101_C03_014E', 'S0101_C03_015E', 'S0101_C03_016E',
        'S0101_C03_017E', 'S0101_C03_018E', 'S0101_C03_019E',
        -- var_id for female population counts by age
        'S0101_C05_002E', 'S0101_C05_003E', 'S0101_C05_004E', 'S0101_C05_005E', 'S0101_C05_006E',
        'S0101_C05_007E', 'S0101_C05_008E', 'S0101_C05_009E', 'S0101_C05_010E', 'S0101_C05_011E',
        'S0101_C05_012E', 'S0101_C05_013E', 'S0101_C05_014E', 'S0101_C05_015E', 'S0101_C05_016E',
        'S0101_C05_017E', 'S0101_C05_018E', 'S0101_C05_019E'
    )
