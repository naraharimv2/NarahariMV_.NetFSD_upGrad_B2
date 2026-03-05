USE EcommAppDb
SELECT 
    customers.first_name, 
    customers.last_name, 
    orders.order_id, 
    orders.order_date, 
    orders.order_status
FROM 
    customers, 
    orders
WHERE 
    customers.customer_id = orders.customer_id
    AND (orders.order_status = 1 OR orders.order_status = 4)
ORDER BY 
    orders.order_date DESC;