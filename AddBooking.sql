DELIMITER //

CREATE PROCEDURE `AddBooking` (
    IN bookingDate DATE,
    IN tableNumber INT,
    IN customerID INT
)
BEGIN
    -- Insert a new booking record with the provided parameters
    INSERT INTO `littlelemondb`.`bookings` (`Date`, `Table_Number`, `Customer_ID`)
    VALUES (bookingDate, tableNumber, customerID);

    -- Get the generated Booking_ID
    SET @newBookingID = LAST_INSERT_ID();

    -- Generate the confirmation message
    SET @confirmationMessage = CONCAT('New booking added: Table ', tableNumber, ' for Customer ', customerID, ' on ', bookingDate, '.');

    -- Return the confirmation message
    SELECT @confirmationMessage AS Confirmation;
END //

DELIMITER ;
