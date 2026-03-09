USE EcommAppDb;
GO

CREATE VIEW vw_product_details AS
SELECT 
p.product_name,
b.brand_name,
c.category_name,
p.model_year,
p.list_price
FROM products p
INNER JOIN brands b
ON p.brand_id = b.brand_id
INNER JOIN categories c
ON p.category_id = c.category_id;
GO

CREATE VIEW vw_order_details AS
SELECT 
o.order_id,
c.first_name + ' ' + c.last_name AS customer_name,
s.store_name,
st.first_name + ' ' + st.last_name AS staff_name,
o.order_date,
o.order_status
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN stores s
ON o.store_id = s.store_id
INNER JOIN staffs st
ON o.staff_id = st.staff_id;
GO

CREATE INDEX idx_products_brand_id ON products(brand_id);
CREATE INDEX idx_products_category_id ON products(category_id);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_store_id ON orders(store_id);
CREATE INDEX idx_orders_staff_id ON orders(staff_id);
CREATE INDEX idx_orderitems_product_id ON order_items(product_id);