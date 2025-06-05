--CQL das consultas.

--Q1 -
SELECT flight_id, airline_id, airplane_id, departure_date, arrival FROM flight_schedule_keyspace.flights_by_airport_by_date WHERE airport_id = 9124
ORDER BY departure_date ASC;

--Q2 -
SELECT flight_id, capacity, airplane_type_id FROM flight_schedule_keyspace.flight_details WHERE flight_id = 143083;

--Q3 -
SELECT flight_id, booking_id, passenger_id, seat, price
FROM booking_passenger_keyspace.passengers_by_flightbooking WHERE flight_id = 388835 AND booking_id = 254924
ORDER BY booking_id ASC, passenger_id ASC;
  
--Q4 -
SELECT passenger_id, birthdate, sex, country, email, telephone, street, city, zip FROM booking_passenger_keyspace.passenger_details
WHERE passenger_id = 274;

--Q5 -
SELECT flight_id, airline_id, airplane_id, departure_date, arrival FROM flight_departure_keyspace.flight_by_departure_by_schedule WHERE airport_id = 4909
ORDER BY flight_id ASC;

--Q6 -
SELECT booking_id, passenger_id, price, seat FROM flight_departure_keyspace.booking_status WHERE booking_id = 181999
ORDER BY passenger_id ASC;
   
--Q7 -
SELECT airport_id, city, country, latitude, longitude
FROM airport_traffic_keyspace.flights_by_destination_city WHERE airport_id = 9124;

--Q8 -
SELECT airport_id, name, country, total_passengers
FROM airport_traffic_keyspace.airplane_capacity_by_destination_city WHERE airport_id = 509;
 