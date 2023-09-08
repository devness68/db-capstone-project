DELIMITER //

CREATE PROCEDURE `UpdateBooking` (
    IN bookingID INT,
    IN bookingDate DATE,
    IN tableNumber INT,
    IN customerID INT
)
BEGIN
    -- Update the existing booking record based on Booking_ID
    UPDATE `littlelemondb`.`bookings`
    SET `Date` = bookingDate,
        `Table_Number` = tableNumber,
        `Customer_ID` = customerID
    WHERE `Booking_ID` = bookingID;

    -- Check if any rows were affected by the update
    IF ROW_COUNT() > 0 THEN
        -- Generate the confirmation message
        SET @confirmationMessage = CONCAT('Booking #', bookingID, ' updated.');

        -- Return the confirmation message
        SELECT @confirmationMessage AS Confirmation;
    ELSE
        -- If no rows were updated, return a message indicating that the booking doesn't exist
        SELECT 'Booking not found.' AS Confirmation;
    END IF;
END //

DELIMITER ;
