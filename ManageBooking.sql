DELIMITER //

CREATE PROCEDURE `AddValidBooking` (
    IN bookingDate DATE,
    IN tableNumber INT,
    IN customerID INT
)
BEGIN
    DECLARE bookingStatusMessage VARCHAR(255);
    DECLARE tableAlreadyBooked INT DEFAULT 0;

    -- Start a transaction
    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO tableAlreadyBooked
    FROM `littlelemondb`.`bookings`
    WHERE `Table_Number` = tableNumber
    AND `Date` = bookingDate;

    IF tableAlreadyBooked > 0 THEN
        -- Rollback the transaction if the table is already booked
        ROLLBACK;
        SET bookingStatusMessage = CONCAT('Table ', tableNumber, ' is already booked. Booking cancelled.');
    ELSE
        -- Insert a new booking record if the table is available
        INSERT INTO `littlelemondb`.`bookings` (`Date`, `Table_Number`, `Customer_ID`)
        VALUES (bookingDate, tableNumber, customerID);

        -- Commit the transaction
        COMMIT;
        SET bookingStatusMessage = CONCAT('Table ', tableNumber, ' is now booked.');
    END IF;

    -- Return the booking status message
    SELECT bookingStatusMessage AS Booking_Status;
END //

DELIMITER ;
