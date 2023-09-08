DELIMITER //
CREATE DEFINER=`devness`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
    SELECT MAX(Quantity) AS MaxOrderedQuantity
    FROM Order_Details;
END //
DELIMITER ;
