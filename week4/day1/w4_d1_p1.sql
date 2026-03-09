USE EcommAppDb;
GO

CREATE PROCEDURE sp_total_sales_per_store
AS
BEGIN
SELECT 
s.store_name,
SUM(oi.quantity * oi.list_price * (1 - ISNULL(oi.discount,0))) AS total_sales
FROM stores s
INNER JOIN orders o ON s.store_id = o.store_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 4
GROUP BY s.store_name
END;
GO

CREATE PROCEDURE sp_orders_by_date_range
@start_date DATE,
@end_date DATE
AS
BEGIN
SELECT 
order_id,
customer_id,
order_date,
order_status
FROM orders
WHERE order_date BETWEEN @start_date AND @end_date
END;
GO

CREATE FUNCTION fn_total_price_after_discount
(
@quantity INT,
@price DECIMAL(10,2),
@discount DECIMAL(4,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
RETURN (@quantity * @price) * (1 - ISNULL(@discount,0))
END;
GO

CREATE FUNCTION fn_top5_selling_products()
RETURNS TABLE
AS
RETURN
(
SELECT TOP 5
p.product_name,
SUM(oi.quantity) AS total_sold
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
);
GO

EXEC sp_total_sales_per_store;

EXEC sp_orders_by_date_range '2017-01-01','2018-12-31';

SELECT dbo.fn_total_price_after_discount(2,1500,0.10);

SELECT * FROM dbo.fn_top5_selling_products();