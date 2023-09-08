DELIMITER //
CREATE DEFINER=`devness`@`%` PROCEDURE `CancelOrder`(IN p_OrderID INT)
BEGIN
    DECLARE v_OrderID INT;
    DECLARE v_Confirmation VARCHAR(255);

    -- Check if the order exists
    SELECT Order_ID INTO v_OrderID FROM Orders WHERE Order_ID = p_OrderID;

    IF v_OrderID IS NOT NULL THEN
        -- Delete the order
        DELETE FROM Orders WHERE Order_ID = p_OrderID;

        -- Set the confirmation message
        SET v_Confirmation = CONCAT('Order ', p_OrderID, ' is cancelled');

        -- Output the confirmation message
        SELECT v_Confirmation AS Confirmation;
    ELSE
        -- If the order does not exist, output a message
        SELECT 'Order does not exist' AS Confirmation;
    END IF;
END //
DELIMITER ;
