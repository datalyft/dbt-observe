{% snapshot snp_dbt__tests %}

{{
    config(
        tags=['tests'],
        strategy='timestamp',
        unique_key='test_name',
        updated_at='checked_date'
    )
}}

-- Set schema, since tests use custom schema on dev
{% if  target.name in ["dev", "ci"] %}
    {%- set test_schema = target.schema ~ '_tests' -%}
{% else %}
     {%- set test_schema = 'dbt_tests' -%}
{% endif %}

{{ generate_tests_stats(test_schema) }}

{% endsnapshot %}