{% snapshot snp_dbt__tests %}

{{
    config(
        tags=['tests'],
        strategy='timestamp',
        unique_key='test_name',
        updated_at='checked_date'
    )
}}

{{ generate_tests_stats(var('test_schema', 'dbt_tests')) }}

{% endsnapshot %}