USE EcommAppDb;
GO

CREATE TRIGGER trg_validate_order_status
ON orders
AFTER UPDATE
AS
BEGIN
BEGIN TRY

IF EXISTS (
    SELECT 1
    FROM inserted
    WHERE order_status = 4
    AND shipped_date IS NULL
)
BEGIN
    THROW 50002, 'Shipped date must not be NULL when order is completed.', 1;
END

END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH
END;
GO