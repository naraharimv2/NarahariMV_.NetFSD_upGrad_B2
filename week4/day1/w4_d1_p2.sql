USE EcommAppDb;
GO

CREATE TRIGGER trg_stock_auto_update
ON order_items
AFTER INSERT
AS
BEGIN
BEGIN TRY

IF EXISTS (
    SELECT 1
    FROM inserted i
    JOIN stocks s 
    ON i.product_id = s.product_id
    WHERE s.quantity < i.quantity
)
BEGIN
    THROW 50001, 'Insufficient stock for the ordered product.', 1;
END

UPDATE s
SET s.quantity = s.quantity - i.quantity
FROM stocks s
JOIN inserted i
ON s.product_id = i.product_id
AND s.store_id = (
        SELECT store_id 
        FROM orders 
        WHERE order_id = i.order_id
    );

END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH
END;
GO