# Part 1 - RDBMS

## Anomaly Analysis

### Insert Anomaly
If a new product is added but has not yet been ordered, it cannot be inserted into the table because product data is tied to order_id.

Example:
Columns: product_id, product_name, category  
Issue: Cannot insert a product without an order_id.

---

### Update Anomaly
If a sales representative changes their email, it must be updated in multiple rows.

Example:
Rows: Any rows where sales_rep_id = same value  
Columns: sales_rep_email  

Issue: If one row is missed, inconsistent data occurs.

---

### Delete Anomaly
If the only order containing a product is deleted, all product information is lost.

Example:
Deleting a row where product_id appears only once removes:
- product_name
- category
- unit_price  

Issue: Loss of important product data.

---

## Normalization Justification

While storing all data in a single table may appear simpler initially, it introduces significant data integrity and maintenance issues. In the given dataset, customer, product, and sales representative details are repeated across multiple rows. For instance, if a sales representative's email changes, it must be updated in every row where that representative appears. This creates an update anomaly and increases the risk of inconsistent data if some rows are missed.

Similarly, the structure prevents inserting new products unless they are part of an order, demonstrating an insert anomaly. A business should be able to maintain a product catalog independently of orders. Additionally, deleting an order may remove the only record of a product or customer, resulting in a delete anomaly and unintended data loss.

Normalization to Third Normal Form (3NF) resolves these issues by separating data into logical tables such as Customers, Products, Orders, and Sales Representatives. This ensures that each piece of information is stored only once, improving consistency and reducing redundancy.

Although normalization introduces more tables and joins, modern database systems efficiently handle such queries. The benefits of improved data integrity, scalability, and maintainability far outweigh the perceived simplicity of a single-table design. Therefore, normalization is not over-engineering but a necessary practice for robust database design.
