/*
Jinia template used by dbt
- Valdiates no column names are null
*/

{% macro no_nulls_in_columns(model) %}
-- Iterates through everysingle column in the complete model
--
SELECT * FROM {{ model }} WHERE 
    {% for col in adapter.get_columns_in_relation(model) -%} -- the "-%" is to trim off whitespaces
        {{ col.column }} IS NULL or -- or is used to skip for lop to the next column name
        {% endfor %}
    False
{% endmacro %}