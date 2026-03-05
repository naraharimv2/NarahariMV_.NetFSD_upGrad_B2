USE EcommAppDb;

SELECT 
s.store_name,
p.product_name,
SUM(oi.quantity) AS total_quantity_sold,
SUM((oi.quantity * oi.list_price) - (oi.quantity * oi.list_price * oi.discount)) AS total_revenue
FROM
(
    SELECT store_id, product_id, quantity
    FROM stocks
    WHERE product_id IN
    (
        SELECT product_id FROM order_items
        INTERSECT
        SELECT product_id FROM stocks WHERE quantity = 0
    )
) st
INNER JOIN stores s 
ON st.store_id = s.store_id
INNER JOIN products p 
ON st.product_id = p.product_id
INNER JOIN orders o 
ON o.store_id = s.store_id
INNER JOIN order_items oi 
ON oi.order_id = o.order_id 
AND oi.product_id = p.product_id
GROUP BY s.store_name, p.product_name;