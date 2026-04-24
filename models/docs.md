{% docs fact_sales_doc %}

This table represents the **order level fact table** in the ecommerce data model.

### Purpose
It stores aggregated order revenue for each order.

### Business Logic
Order value is calculated as **SUM(quantity * price)** from order items.
Each record represents **one order**.

### Grain
One row per **order_id**.

### Upstream Models
int_orders_enriched
stg_order_items

### Downstream Usage
Used for:
Sales dashboards
Revenue analysis
Customer analytics

{% enddocs %}
