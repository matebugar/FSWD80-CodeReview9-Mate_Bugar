SELECT customer.first_name,customer.last_name,customer.driving_license_nr,booking.booking_date,cars.manufacturer,cars.model,cars.color
FROM customer
INNER JOIN booking ON customer.customer_id = booking.fk_customer_id
INNER JOIN cars ON cars.fk_booking_id = booking.booking_id

SELECT customer.first_name,customer.last_name,invoice.sum,additionalfee.damage
FROM customer 
INNER JOIN invoice ON invoice.fk_customer_id = customer.customer_id
INNER JOIN additionalfee ON additionalfee.fk_invoice_id = invoice.invoice_id

SELECT booking.booking_date, bookinglocation.pickup_location, bookinglocation.return_location, bookingdate.pickup_date,bookingdate.return_date,agency.location_city,agency.location_country, rentalagent.first_name,rentalagent.last_name
FROM booking 
INNER JOIN bookinglocation ON booking.booking_id = bookinglocation.fk_booking_id
INNER JOIN bookingdate ON booking.booking_id = bookingdate.fk_booking_id
INNER JOIN rentalagent ON booking.booking_id = rentalagent.fk_booking_id 
INNER JOIN agency ON agency.agency_id = rentalagent.fk_agency_id