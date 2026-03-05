USE EcommAppDb;

SELECT 
o.order_id,
c.first_name + ' ' + c.last_name AS customer_name,
DATEDIFF(DAY, o.order_date, o.shipped_date) AS processing_delay,
CASE 
    WHEN o.shipped_date > o.required_date THEN 'Delayed'
    ELSE 'On Time'
END AS delivery_status
FROM orders o
INNER JOIN customers c 
ON o.customer_id = c.customer_id
WHERE o.customer_id IN
(
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING MIN(order_status) = 4
);