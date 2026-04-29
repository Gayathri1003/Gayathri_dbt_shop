{% macro calculate_revenue(q, p) %}

    coalesce({{ q }}, 0) * coalesce({{ p }}, 0)

{% endmacro %}