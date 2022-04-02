{% macro grant_select(schema=target.schema,role=target.role) %}
{% set sql %}
grant usage on {{schema}} to {{role}};
grant select on all tables in schema {{schema}} to {{role}};
grant select on all views in schema {{schema}} to {{role}};
{% endset %}

{{log('Granting priviledges on all tables and views in' ~target.schema ~ 'to role' ~role ,info=True)}}
{% do run_query(sql) %}
{{log('Priviledges granted',info=True)}}

{%endmacro%}