{% macro conv_string_to_double(column_name) -%}
try_to_double(nullif(replace(replace(replace(trim({{ column_name }}), ',',''),'$',''),' ',''), ''))
{%- endmacro %}


->date_empty_date_to_null.sql

{% macro empty_date_to_null(column_name) -%}
case
    when len({{ column_name }}) < 5 then null
    else     TRY_TO_DATE(nullif(nullif(TRY_TO_DATE(nullif(replace(replace(replace(replace(ltrim(rtrim({{ column_name }})),' 00:00:00.000',''),' 0:00:00',''),' 0:00',''),' ',''),'') ), '1800-01-01'),'1900-01-01'))::date
end 

{%- endmacro %}