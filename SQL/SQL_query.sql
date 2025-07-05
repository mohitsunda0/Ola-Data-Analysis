Create database ola;
Use ola;
select * from Bookings;


-- 1. Retrieve all successful bookings:
create view Successful_Bookings as
select* from Bookings where Booking_Status = 'Success';

select* from successful_bookings;

-- 2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select vehicle_type , avg(ride_distance)
as avg_distance from bookings group by vehicle_type;

select* from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides AS
SELECT COUNT(*) AS total_cancelled
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM cancelled_rides;

-- 4. List the top 5 customers who booked the highest number of rides:
create view Top_customers as
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

select* from top_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE OR REPLACE VIEW cancelled_rides_by_driver AS
SELECT COUNT(*) AS total_cancelled_by_driver
FROM bookings
WHERE Incomplete_Rides_Reason = 'personal and car-related issues';

SELECT * FROM cancelled_rides_by_driver;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE OR REPLACE VIEW prime_sedan_rating_range AS
SELECT 
  MAX(Driver_Ratings) AS max_rating,
  MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

select* from prime_sedan_rating_range;

-- 7. Retrieve all rides where payment was made using UPI:
CREATE OR REPLACE VIEW upi_payments AS
SELECT * 
FROM bookings
WHERE Payment_Method = 'UPI';

select *from upi_payments;

-- 8. Find the average customer rating per vehicle type:
CREATE OR REPLACE VIEW avg_rating_per_vehicle AS
SELECT 
  Vehicle_Type, 
  AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

select* from avg_rating_per_vehicle;

-- 9. Calculate the total booking value of rides completed successfully:
CREATE OR REPLACE VIEW total_value_completed_rides AS
SELECT 
  SUM(Booking_Value) AS total_booking_value
FROM bookings
WHERE Booking_Status = 'Completed';

select* from total_value_completed_rides;

-- 10. List all incomplete rides along with the reason:
CREATE OR REPLACE VIEW incomplete_rides_with_reason AS
SELECT 
  Booking_ID, 
  Customer_ID, 
  Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides_Reason IS NOT NULL;

select* from incomplete_rides_with_reason; 