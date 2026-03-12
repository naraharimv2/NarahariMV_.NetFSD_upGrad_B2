USE EcommAppDb;
GO

BEGIN TRY
BEGIN TRANSACTION;

DECLARE @order_id INT;

INSERT INTO orders
(customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
VALUES
(1,1,GETDATE(),DATEADD(DAY,7,GETDATE()),NULL,1,1);

SET @order_id = SCOPE_IDENTITY();

IF EXISTS (
    SELECT 1
    FROM stocks
    WHERE product_id = 1
    AND store_id = 1
    AND quantity < 2
)
BEGIN
    THROW 50010,'Insufficient stock for this product.',1;
END

INSERT INTO order_items
(order_id,item_id,product_id,quantity,list_price,discount)
VALUES
(@order_id,1,1,2,5000,0.05);

COMMIT TRANSACTION;

END TRY

BEGIN CATCH
ROLLBACK TRANSACTION;
PRINT ERROR_MESSAGE();
END CATCH;

USE EcommAppDb;
GO

CREATE TRIGGER trg_reduce_stock_after_order
ON order_items
AFTER INSERT
AS
BEGIN

IF EXISTS (
    SELECT 1
    FROM inserted i
    JOIN orders o ON i.order_id = o.order_id
    JOIN stocks s ON s.product_id = i.product_id 
                 AND s.store_id = o.store_id
    WHERE s.quantity < i.quantity
)
BEGIN
    THROW 50011,'Stock insufficient. Order cannot be completed.',1;
END

UPDATE s
SET s.quantity = s.quantity - i.quantity
FROM stocks s
JOIN inserted i ON s.product_id = i.product_id
JOIN orders o ON i.order_id = o.order_id
WHERE s.store_id = o.store_id;

END;