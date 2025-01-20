{{ config(
    materialized='table',
    schema='refined'
) }}

SELECT
    v.var_key,
    v.var_group,
    v.var_label,
    v.concept,
    v.predicate_type,
    v.survey
FROM
    {{ ref('refined.hub_var') }} v
