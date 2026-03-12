USE EcommAppDb;
GO

BEGIN TRY
BEGIN TRANSACTION;

DECLARE @order_id INT = 1;

SAVE TRANSACTION before_stock_restore;

UPDATE s
SET s.quantity = s.quantity + oi.quantity
FROM stocks s
JOIN order_items oi ON s.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_id = @order_id
AND s.store_id = o.store_id;

IF @@ERROR <> 0
BEGIN
    ROLLBACK TRANSACTION before_stock_restore;
    THROW 50020,'Stock restoration failed.',1;
END

UPDATE orders
SET order_status = 3
WHERE order_id = @order_id;

COMMIT TRANSACTION;

END TRY

BEGIN CATCH
ROLLBACK TRANSACTION;
PRINT ERROR_MESSAGE();
END CATCH;